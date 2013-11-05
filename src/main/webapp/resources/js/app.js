var Dashboard = (function() {
	function showReports() {
		var $reportContainers = $("._reportContainer");
		$reportContainers.each(function() {
			var $reportContainer = $(this), 
			report = this.id.split("_")[0];
			loadReport($reportContainer, report);
		});
	}
	var reportStack = [];
	function getReportContainer(reportId){
		return $("._reportContainer[id*="+reportId+"]");
	}
	function loadReport($reportContainer, report, params){
		var url = "/report/" + report + ".html";
		if(! $.isEmptyObject(params)){
			url = url+"?"+$.param(params);
		}
		//$reportContainer.block();
		$.ajax({
			url : url,
			dataType : "html",
			type: "GET"
		}).done(
				function(data) {
					var $htmlNode = $(data),
					$highChartsParent = $htmlNode.find("div");
					if($highChartsParent.length){
						var hcScripts = $htmlNode.filter("script");
						$reportContainer.html($highChartsParent).append(hcScripts);
					}
					else{
						var $pageAnchors = $htmlNode.find("a[name^='JR_PAGE_ANCHOR_0']"),
						totalItems = $pageAnchors.length;
						if(totalItems > 1)
						{
							var $contentTable = $htmlNode.filter("table");
							$contentTable.find("img").each(function() {
								this.src = this.src + "&jrprint=" + report + "_report";
							});
							$pageAnchors.next().each(function(i, elem){
								if(i){
									$(elem).hide();
								}
							});
							var $carouselAnchors = $("<a class=\"carousel-control left\">&lsaquo;</a><a class=\"carousel-control right\">&rsaquo;</a>");
							var currentItemIndex = 1;
							$carouselAnchors.click(function(){
								var $anchor = $(this),
								$parent = $anchor.parent(),
								$currentItem = $parent.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next(),
								$targetItem = null;
								if($anchor.hasClass("left") ){
									if(currentItemIndex > 1){
										currentItemIndex--;
										$targetItem = $parent.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next();	
									}
								}
								else{
									if(currentItemIndex < totalItems){
										currentItemIndex++;	
										$targetItem = $parent.find("a[name='JR_PAGE_ANCHOR_0_"+currentItemIndex+"']").next();	
									}
								}
								if($targetItem){
									$currentItem.hide();
									$targetItem.show();
								}
								
							});
							$contentTable.find("br").remove();
							$reportContainer.html($contentTable.find("td:eq(1)").html()).append($carouselAnchors);
						}
						else{
							var $contentTable = $htmlNode
									.find("table:first");
							$contentTable.find("img").each(
									function() {
										this.src = this.src + "&jrprint=" + report
												+ "_report";
									});	
							$reportContainer.html($contentTable);	
						}
					}
					//$reportContainer.unblock();
				});
	}
	
	return {
		init : function(filterBar) {
			showReports();
			$("._backBtn").click(function(){
				Dashboard.back();
			});
		},
		loadDrillDownReport : function(reportId, params){
			loadReport(getReportContainer(reportId), reportId, params);
			reportStack.push({	"reportId": reportId,
				"params" : params});
		},
		back : function(){
			var previousReport = reportStack.pop();
			loadReport(getReportContainer(previousReport.reportId), previousReport.reportId, previousReport.params)
		}
	}
})();