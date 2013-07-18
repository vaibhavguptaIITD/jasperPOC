<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>

<!DOCTYPE html>


<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Report</title>
<decorator:head />
</head>

<body class="signinBody">
	<decorator:getProperty property="page.report.aircraftType"/>
	<decorator:getProperty property="page.report.aircraftEngineType"/>
	<decorator:getProperty property="page.report.aircraftYearType"/>
</body>
</html>
