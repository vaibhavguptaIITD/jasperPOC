<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>Dashboard</title>
<!--CSS Files-->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
</head>

<body>
	<div class="row-fluid mainContainer">
		<div class="subContainer clearfix">
			<!--Top Header and Top Navigation-->
			<article class="centerSection clearfix">
				<!--leftmenu-->
				<div class="centercontent">
					<div class=" row-fluid">
						<h1 class="pageTitle">Dashboard</h1>
						<div class="row-fluid clearfix">
							<div class="span12">
								<div class="row-fluid">
									<ul>
										<li class="span5">
											<h3>
												Aircraft by type Highcharts
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftsByStateAndYear.pdf"><i class="icon-download"></i> PDF</a>
											<a class="_backBtn"><i class="icon-arrow-left"></i> BACK</a>
											<div id="aircraftsByStateAndYear_aircraftCertByStateAndYear" class="_reportContainer"></div>
										</li>
									</ul>
								</div>
							</div>

						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</article>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/highcharts-2.3.2.original.src.js"></script>
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/item.hyperlink.service.js"></script>
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default.service.js"></script>
<script class="jasperreports" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script type="text/javascript">
$(function(){
	Dashboard.init();
});
</script>
	
</body>
</html>