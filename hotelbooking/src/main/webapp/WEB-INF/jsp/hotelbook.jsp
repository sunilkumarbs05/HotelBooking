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
			
			$("#checkin").datepicker({
		        numberOfMonths: 1,
		        changeMonth: true,
		        changeYear: true,
		        dateFormat: 'dd-mm-yy',
		        onSelect: function (selected) {
		            var dt = new Date(selected);
		            dt.setDate(dt.getDate() + 1);
		            $("#checkout").datepicker("option", "minDate", dt);
		        }
		    });
		    $("#checkout").datepicker({
		        numberOfMonths: 1,
		        changeMonth: true,
		        changeYear: true,
		        dateFormat: 'dd-mm-yy',
		        onSelect: function (selected) {
		            var dt = new Date(selected);
		            dt.setDate(dt.getDate() - 1);
		            $("#checkin").datepicker("option", "maxDate", dt);
		        }
		    });
			
		/*  $('.date-picker').datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat: 'dd-mm-yy',
		   }); */
			 
			$("#city").change(function() {
				if($("#city option:selected").text() != "Select...."){
					var resultHTML;
					 $.ajax({
							type : "GET",
							url : "getHotels/"+$("#city option:selected").text(),
							success : function(data) {
								resultHTML="<option>Select..</option>";
							 	$.each(data, function(index, itemData) {
									resultHTML=resultHTML+"<option>"+itemData+"</option>";
								});
							   	$("#hotel").html(resultHTML);  
							}
					    });	
				   } 
				}); 
			
			
			
				$("#submit").click(function(){
					
					if($("#city option:selected").text()=='Select..' || $("#hotel option:selected").text()=='Select..' || $("#checkin").val()== '' ||  $("#checkout").val()== '' ||  $("#noRooms").val()== '' ){
						$("#message").text("Please enter mandatory fields");
						
					} else {
						var sendData={ city:$("#city option:selected").text(), hotelName:$("#hotel option:selected").text(), checkin:$("#checkin").val(),checkout:$("#checkout").val(), numberRooms:$("#noRooms").val()};
						  $.ajax({
							type : "POST",
							url : "bookHotel",
							data :JSON.stringify(sendData),
							dataType : "json",
							contentType: "application/json; charset=utf-8",
							success : function(data) {
								$("#message").text(data.message);
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
		<div><h1>Welcome to Hotel Booking</h1></div>
		<div>
			<form action="">
			<div>
				<table> 
					<tr>
				  		<td><label>Select a City:<sup>*</sup></label></td>
						<td><select id="city">
							<option>Select..</option>
							<c:forEach items="${cities}" var="city">
									<option><c:out value="${city}"/></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr><td><label>Select a Hotel:<sup>*</sup></label></td>
						<td><select id="hotel">
							<option>Select..</option>
							</select>
						</td>
					</tr>
					<tr><td><label>Select CheckIn Date:<sup>*</sup></label></td>
						<td><input type="text" id="checkin" placeholder="DD-MM-YYYY" class="date-picker"/></td>
					</tr>
					<tr><td><label>Select CheckOut Date:<sup>*</sup></label></td>
						<td><input type="text" id="checkout" placeholder="DD-MM-YYYY" class="date-picker"/></td>
					</tr>
					<tr><td>Enter No of Rooms:<sup>*</sup></td>
						<td><input type="number" id="noRooms"/></td>
					</tr>
				</table>
			</div>
			<div style="margin-left: 100px;  margin-top: 10px;">
				<input type="button" id="submit" value="Book Room">
				<input type="button" id="cancel" value="Cancel">
			</div>
			</form>
		</div> 
		<div>
			<p id="message"></p>
		</div>
	</body>
</html>