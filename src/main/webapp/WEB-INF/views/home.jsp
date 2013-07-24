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
						<div class="filterbox borderRightBox">
							<form enctype="multipart/form-data"
								class="form-inline">
								<fieldset>
									<legend class="hide">Aircrafts:</legend>
									<div class="clearfix span3 marginLeftzero">
										<div class="control-label span12">
											<strong>Filter:</strong>
										</div>
										<div class="control-label span12">
											<select name="filters[state]">
												<option value="">Select</option>
												<option value="NY">NY</option>
												<option value="CO">CO</option>
												<option value="NV">NV</option>
											</select>
										</div>
									</div>
									<div class="control-label span1 pull-right">
										<button>Go</button>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="row-fluid clearfix">
							<div class="span12">
								<div class="row-fluid">
									<ul>
										<li class="span5">
											<h3>
												Aircraft by type 
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftType.pdf?${filters}"><i class="icon-download"></i> PDF</a>
											<div class="dashBGraph">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#aircraftType"
														data-toggle="tab">Type</a></li>
													<li class="borderRight"><a href="#aircraftEngineType"
														data-toggle="tab">Engine Type</a></li>
													<li class="borderRight"><a href="#aircraftTypeCustom"
														data-toggle="tab">Type custom</a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="aircraftType"></div>
													<div class="tab-pane" id="aircraftEngineType"></div>
													<div class="tab-pane" id="aircraftTypeCustom"></div>
												</div>
											</div>
										</li>
										<li class="span5">
											<h3>
												Aircraft by type and year
												
											</h3>
											<a href="${pageContext.request.contextPath}/report/aircraftYearType.pdf?${filters}"><i class="icon-download"></i> PDF</a>
											<div class="dashBGraph" id="aircraftYearType"></div>
										</li>
									</ul>
								</div>
							</div>

						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- centercontent -->
				<!--contentwrapper-->
				<!--<br clear="all" />-->
			</article>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script type="text/javascript">
	var reports = [ "aircraftYearType", "aircraftType", "aircraftEngineType","aircraftTypeCustom" ];
	var index = 0;
	$(function() {
		showReport(reports[index]);
	});

	function showReport(report) {
		$.ajax(
				{
					url : "${pageContext.request.contextPath}/report/" + report
							+ ".html?${filters}",
					dataType : "html"
				}).done(function(data) {
					var $htmlNode = $(data),
					$reportContainer = $("#" + report),
					$contentTable = $htmlNode.find("table:first");
					$contentTable.find("img").each(function() {
						this.src = this.src + "&jrprint=" + report + "_report";
					});
					$reportContainer.append($htmlNode.find("table:first"));
					if(index < reports.length - 1){
						index++;
						showReport(reports[index]);
					}
				});
	}

</script>
</body>
</html>