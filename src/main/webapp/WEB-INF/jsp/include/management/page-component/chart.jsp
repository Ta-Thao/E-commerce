

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-12">
                <div class="card card-box">
                    <div class="card-head">
                        <header>Chart Survey</header>
                        <div class="tools">
                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                        </div>
                    </div>
                    <div class="card-body no-padding height-9">
                        <div class="row text-center">
                            <div class="col-sm-3 col-6">
                                <h4 class="margin-0">$ 209 </h4>
                                <p class="text-muted"> Today's Income</p>
                            </div>
                            <div class="col-sm-3 col-6">
                                <h4 class="margin-0">$ 837 </h4>
                                <p class="text-muted">This Week's Income</p>
                            </div>
                            <div class="col-sm-3 col-6">
                                <h4 class="margin-0">$ 3410 </h4>
                                <p class="text-muted">This Month's Income</p>
                            </div>
                            <div class="col-sm-3 col-6">
                                <h4 class="margin-0">$ 78,000 </h4>
                                <p class="text-muted">This Year's Income</p>
                            </div>
                        </div>
                        <div class="row">
                            <div id="area_line_chart" class="width-100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
