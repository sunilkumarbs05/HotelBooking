<%@ taglib prefix="form" uri="/WEB-INF/tlds/spring-form.tld"%>
<%@ taglib prefix="spring" uri="/WEB-INF/tlds/spring.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/tlds/c.tld"%>
<html>
	<head>
		
		<script type="text/javascript" src="/resources/js/scripts/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="/resources/js/scripts/jquery-ui.js"></script>
		<script type="text/javascript" src="/resources/js/scripts/json2.js"></script>
		<link rel="stylesheet" type="text/css"	href="/resources/css/jquery-ui.css"/>
		<script>
			$(document).ready(function(){
			$("#city").change(function() {
				if($("#city option:selected").text() != "Select...."){
					var resultHTML;
					 $.ajax({
							type : "GET",
							url : "getHotelsDetails/"+$("#city option:selected").text(),
							success : function(data) {
								resultHTML="<table><tr><th>HotelName</th><th>No of Rooms</th><th>Price</th><th>Star</th></tr>";
							 	$.each(data, function(index, itemData) {
									resultHTML=resultHTML+"<tr><td>"+itemData.hotelname+"</td>";
									resultHTML=resultHTML+"<td>"+itemData.numberrooms+"</td>";
									resultHTML=resultHTML+"<td>"+itemData.price+"</td>";
									resultHTML=resultHTML+"<td>"+itemData.star+"</td></tr>";
								});
							 	resultHTML=resultHTML+"</table>";
							   	$("#resultant").html(resultHTML);  
							}
					    });	
				   } 
			});
			
			$("#cancel").click(function(){
				window.location.href="/home";
			});
			
			});
		</script>
			
	</head>
	<body>
	 	<div><h1>View Hotels</h1></div>
		<div>
			<table>
				<tr>
					<td><label>Select a City:</label></td>
						<td><select id="city">
							<option>Select..</option>
							<c:forEach items="${cities}" var="city">
									<option><c:out value="${city}"/></option>
								</c:forEach>
							</select>
					</td>
				</tr>
			</table>
		</div>
		<div style="margin-left: 100px;  margin-top: 10px;"><input type="button" id="cancel" value="Cancel"></div>
		<div id="resultant"></div>
	 </body>
</html>