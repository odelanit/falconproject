<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    // add by amit
    var flag = true;
    jQuery(document).ready(function ($) {

        $("#toggle_sidemenu_l").click(function () {

            if ($('body').hasClass('off')) {
                $(".ui-tabs-page").removeClass("sb-r-c onload-check sb-l-c sb-l-m sb-l-o off");
                $(".ui-tabs-page").addClass("sb-r-c onload-check");
            } else {
                f1();
            }

        });
        $(".sidebar-toggle-mini").click(function () {
            $(".ui-tabs-page").removeClass('sb-r-c onload-check sb-l-o sb-l-m mobile-view tray-rescale');
            $(".ui-tabs-page").addClass("sb-r-c onload-check sb-l-c sb-l-m sb-l-o off");
        });


        if (jQuery(window).width() < 768) {

            $(".add-fc").addClass("form-control");
            var flag = false;
            f1();

            if (jQuery(window).width() <= 325) {
                $(".mob-panel-heading").css({'margin-top': '57%'});

            } else if (jQuery(window).width() > 325 && jQuery(window).width() < 370) {
                $(".mob-panel-heading").css({'margin-top': '38%'});

            } else if (jQuery(window).width() > 370 && jQuery(window).width() < 579) {
                $(".mob-panel-heading").css({'margin-top': '40%'});
            } else {
                $(".mob-panel-heading").css({'margin-top': '10%'});
            }

            //$(".ui-tabs-page").addClass("sb-l-o sb-l-m  mobile-view tray-rescale");
            $(".ui-tabs-page").addClass("sb-l-m  mobile-view tray-rescale");


        }
        if (jQuery(window).width() < 800) {
            if ($(".ui-tabs-page").hasClass('sb-l-o')) {
                $(".ui-tabs-page").removeClass('sb-l-o');
            }

        }
        if (jQuery(window).width() > 800) {
            if (!$(".ui-tabs-page").hasClass('sb-l-o')) {
                $(".ui-tabs-page").addClass('sb-l-o');
            }

        }
    })

    //end by amit

    window.addEventListener("beforeunload", function (e) {
        document.getElementById("logoutForm").submit();

        /* var confirmationMessage = "\o/";

      (e || window.event).returnValue = confirmationMessage; //Gecko + IE
      return confirmationMessage;                            //Webkit, Safari, Chrome */
    });

    //added by amit
    //var flag=true;
    function f1() {
        if (flag) {
            //ui-tabs-page sb-r-c onload-check
            //ui-tabs-page sb-r-c onload-check sb-l-o sb-l-m mobile-view tray-rescale
            $(".ui-tabs-page").removeClass('sb-l-m');
            $(".ui-tabs-page").addClass('sb-r-c onload-check');


            flag = false;
        } else {
            $(".ui-tabs-page").addClass('sb-l-m');

            flag = true;
        }
    }

    //end by amit

</script>

<header class="navbar navbar-fixed-top navbar-shadow dont-print">

    <!-- <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"> -->

    <div class="navbar-branding"><a class="navbar-brand" href="#">
        <img src="<c:url value="/resources/images/logo.png"/>" class="img-responsive thumbnail mr25"/>
    </a></div>
    <ul class="nav navbar-nav navbar-left">
        <span id="toggle_sidemenu_l" class="fa fa-bars fa-lg"></span>
        <li class="nav navbar-nav pull-right hidden"><a href="#" class="sidebar-menu-toggle"> <span
                class="octicon octicon-ruby fs20 mr10 pull-right "></span> </a></li>
        <li class="hidden-xs"><a class="request-fullscreen toggle-active" href="#"> <span
                class="fa fa-object-group"></span> </a></li>
    </ul>
    <form class="navbar-form navbar-left navbar-search ml5" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search..." value="Search...">
        </div>
    </form>


    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown menu-merge"><a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
            <img src="<c:url value="/resources/images/1.png"/>" alt="" class="mw30 br64"/>
            <span class="hidden-xs pl15"><b><font color="black">${sessionScope.username}</font></b></span> <span
                class="caret caret-tp hidden-xs"></span> </a>
            <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                <li class="dropdown-header clearfix">
                    <div class="pull-left ml10">
                        <!--   <select id="user-status">
                             <optgroup label="Current Status:">
                             <option value="1-1">Away</option>
                             <option value="1-2">Offline</option>
                             <option value="1-3" selected="selected">Online</option>
                             </optgroup>
                           </select> -->
                    </div>
                    <div class="pull-right mr10">
                        <!--   <select id="user-role">
                             <optgroup label="Logged in As:">
                             <option value="1-1">Client</option>
                             <option value="1-2">Editor</option>
                             <option value="1-3" selected="selected">Admin</option>
                             </optgroup>
                           </select> -->
                    </div>
                </li>
                <li class="list-group-item"><a href="#" class="animated animated-short fadeInUp"> <span
                        class="fa fa-envelope"></span> Messages <span class="label label-warning">2</span></a></li>
                <li class="list-group-item"><a href="#" class="animated animated-short fadeInUp"> <span
                        class="fa fa-user"></span> Friends <span class="label label-warning">6</span></a></li>
                <li class="list-group-item"><a href="#" class="animated animated-short fadeInUp"> <span
                        class="fa fa-bell"></span> Notifications </a></li>
                <li class="list-group-item"><a href="#" class="animated animated-short fadeInUp"> <span
                        class="fa fa-gear"></span> Settings </a></li>
                <li class="dropdown-footer">
                    <a href="logout">
                        <c:if test="${not empty sessionScope.username}">
                            <span class="fa fa-power-off pr5"></span>Logout
                        </c:if>
                    </a>

                </li>
            </ul>
        </li>
    </ul>
</header>