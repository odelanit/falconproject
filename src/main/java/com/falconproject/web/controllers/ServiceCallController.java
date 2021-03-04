package com.falconproject.web.controllers;

import com.falconproject.web.models.FileDB;
import com.falconproject.web.models.Line;
import com.falconproject.web.models.ServiceCall;
import com.falconproject.web.repository.FileDBRepository;
import com.falconproject.web.repository.LineRepository;
import com.falconproject.web.repository.ServiceCallRepository;
import com.falconproject.web.service.UserDetailsImpl;
import com.falconproject.web.specification.SearchCriteria;
import com.falconproject.web.specification.ServiceCallSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "/serviceCall")
public class ServiceCallController {
    @Autowired
    protected ServiceCallRepository serviceCallRepository;

    @Autowired
    protected LineRepository lineRepository;

    @Autowired
    protected FileDBRepository fileDBRepository;

    @GetMapping("")
    public String index(@RequestParam(value = "sf", required = false) String sortField, @RequestParam(value = "sd", required = false) String sortDir, @RequestParam(value = "k", required = false) String keyword, Model model) {
        if (sortField == null) sortField = "id";

        Sort.Direction direction;
        String reverseDir;
        if (sortDir == null) {
            direction = Sort.Direction.ASC;
            reverseDir = "desc";
        } else {
            direction = sortDir.equals("asc") ? Sort.Direction.ASC : Sort.Direction.DESC;
            reverseDir = sortDir.equals("asc") ? "desc" : "asc";
        }

        if (keyword != null) {
            Specification<ServiceCall> spec = new ServiceCallSpecification(new SearchCriteria("editorField", ":", keyword));
            spec = Specification.where(spec).or(new ServiceCallSpecification(new SearchCriteria("secondEditor", ":", keyword)));
            model.addAttribute("serviceCalls", serviceCallRepository.findAll(spec, Sort.by(direction, sortField)));
        } else {
            model.addAttribute("serviceCalls", serviceCallRepository.findAll(Sort.by(direction, sortField)));
        }
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", reverseDir);
        model.addAttribute("keyword", keyword);
        return "serviceCallSearch";
    }

    @GetMapping("/add")
    public String create(Model model) {
        model.addAttribute("serviceCallForm", new ServiceCall());
        return "serviceCallAdd";
    }

    @PostMapping("/store")
    public String store(@ModelAttribute("serviceCallForm") ServiceCall serviceCall, @AuthenticationPrincipal UserDetailsImpl userDetails) {
        LocalDateTime dateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm a");
        serviceCall.setEditorField(serviceCall.getEditorField() + "<p>Edited by " + userDetails.getUsername() + " " + dateTime.format(formatter) + "</p>");
        serviceCall.setSecondEditor(serviceCall.getSecondEditor() + "<p>Edited by " + userDetails.getUsername() + " " + dateTime.format(formatter) + "</p>");
        serviceCall = serviceCallRepository.save(serviceCall);

        try {
            JSONArray jsonArray = new JSONArray(serviceCall.getLinesJson());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String part = jsonObject.getString("part");
                String description = jsonObject.getString("description");
                String label = jsonObject.getString("label");
                int qtyOrdered = jsonObject.getInt("qty_ordered");
                int qtyDelivered = jsonObject.getInt("qty_delivered");
                String orderFilledBy = jsonObject.getString("order_filled_by");

                Line line = new Line();
                line.setPart(part);
                line.setDescription(description);
                line.setLabel(label);
                line.setQtyOrdered(qtyOrdered);
                line.setQtyDelivered(qtyDelivered);
                line.setOrderFilledBy(orderFilledBy);
                line.setServiceCall(serviceCall);
                lineRepository.save(line);
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return "redirect:/serviceCall";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) throws JSONException {
        ServiceCall serviceCall = serviceCallRepository.findById(id).get();
        Set<Line> lines = serviceCall.getLines();
        if (lines != null && lines.size() > 0) {
            JSONArray array = new JSONArray();
            for (Line line : lines) {
                array.put(new JSONObject()
                        .put("id", line.getId())
                        .put("part", line.getPart())
                        .put("description", line.getDescription())
                        .put("label", line.getLabel())
                        .put("qty_ordered", line.getQtyOrdered())
                        .put("qty_delivered", line.getQtyDelivered())
                        .put("order_filled_by", line.getOrderFilledBy())
                );
            }
            serviceCall.setLinesJson(array.toString());
        }
        model.addAttribute("serviceCallForm", serviceCall);
        return "serviceCallEdit";
    }

    @PostMapping("/edit/{id}")
    public String update(@PathVariable Long id, @ModelAttribute("serviceCallForm") ServiceCall serviceCallForm, @AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {
        ServiceCall serviceCall = serviceCallRepository.findById(id).get();

        LocalDateTime dateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm a");
        serviceCall.setEditorField(serviceCallForm.getEditorField() + "<p>Edited by " + userDetails.getUsername() + " " + dateTime.format(formatter) + "</p>");
        serviceCall.setSecondEditor(serviceCallForm.getSecondEditor() + "<p>Edited by " + userDetails.getUsername() + " " + dateTime.format(formatter) + "</p>");
        serviceCall.setIntegerField(serviceCallForm.getIntegerField());
        serviceCall.setStringField(serviceCallForm.getStringField());
        serviceCall.setDateField(serviceCallForm.getDateField());
        serviceCall.setFiles(serviceCallForm.getFiles());

        serviceCall = serviceCallRepository.save(serviceCall);
        lineRepository.deleteAll(serviceCall.getLines());

        try {
            JSONArray jsonArray = new JSONArray(serviceCallForm.getLinesJson());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String part = jsonObject.getString("part");
                String description = jsonObject.getString("description");
                String label = jsonObject.getString("label");
                int qtyOrdered = jsonObject.getInt("qty_ordered");
                int qtyDelivered = jsonObject.getInt("qty_delivered");
                String orderFilledBy = jsonObject.getString("order_filled_by");

                Line line = new Line();
                line.setPart(part);
                line.setDescription(description);
                line.setLabel(label);
                line.setQtyOrdered(qtyOrdered);
                line.setQtyDelivered(qtyDelivered);
                line.setOrderFilledBy(orderFilledBy);
                line.setServiceCall(serviceCall);
                lineRepository.save(line);
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return "redirect:/serviceCall";
    }

    @GetMapping("/show/{id}")
    public String show(@PathVariable Long id, Model model) {
        ServiceCall serviceCall = serviceCallRepository.findById(id).get();
        model.addAttribute("serviceCall", serviceCall);
        return "serviceCallShow";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        ServiceCall post = serviceCallRepository.findById(id).get();
        String editorField = post.getEditorField();
        List<String> imgSources = this.getImgSrc(editorField);
        for (String imgSrc : imgSources) {
            String[] strings = imgSrc.split("/files/");
            String uuid = strings[1];
            fileDBRepository.deleteById(uuid);
        }
        serviceCallRepository.deleteById(id);
        return "redirect:/serviceCall";
    }

    @GetMapping("/edit/{id}/files")
    @ResponseBody
    public Set<FileDB> getAllFiles(@PathVariable Long id) {
        ServiceCall serviceCall = serviceCallRepository.findById(id).get();
        return serviceCall.getFiles();
    }

    @PostMapping("/edit/{id}/files/{fileId}")
    @ResponseBody
    public HashMap<String, String> getAllFiles(@PathVariable Long id, @PathVariable String fileId) {
        ServiceCall post = serviceCallRepository.findById(id).get();
        FileDB fileDB = fileDBRepository.findById(fileId).get();
        post.removeFileDB(fileDB);
        fileDBRepository.deleteById(fileId);
        HashMap<String, String> map = new HashMap<>();
        map.put("message", "Deleted");
        return map;
    }

    private List<String> getImgSrc(String htmlStr) {
        if (htmlStr == null) {

            return null;
        }

        String img = "";
        Pattern p_image;
        Matcher m_image;
        List<String> pics = new ArrayList<String>();

        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            img = img + "," + m_image.group();
            // Matcher m =
            // Pattern.compile ( "src = \" (*) (\ "|> | \\ s +)"?.?) Matcher (img);. // src match
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);

            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;
    }
}
