<%@page import="MovieBusinessLayer.*"%>
<%@page import="MovieClassLayer.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%!MovieBusinessLayer mbl = new MovieBusinessLayer();
Films films = mbl.GetFilmsFromCSV("C:\\Everything\\Capita\\NovusMovieProject\\MovieDataLayer\\TestData.csv");
%>


<script language="JavaScript">
	function getOptions(option, ID) {
		var list;
		var listValue;
		if (option == "FilmNameList") {
			<%

			%>
			list = new Array("Budweiser", "Coors", "Longboard",
					"Miller Genuine Draft", "Heineken");
			listValue = new Array("Budweiser", "Coors", "Longboard",
					"Miller Genuine Draft", "Heineken");
		}
		if (option == "DirectorNameList") {
			list = new Array("Bridgeport IPA", "Red Hook ESB", "Alaskan Amber",
					"Widmer Hefewiezen");
			listValue = new Array("Bridgeport IPA", "Red Hook ESB",
					"Alaskan Amber", "Widmer Hefewiezen");
		}
		if (option == "ActorNameList") {
			list = new Array("Black Butte", "Pete's Wicked", "Guiness");
			listValue = new Array("Black Butte", "Pete's Wicked", "Guiness");
		}
		for (var i = 0; i < document.OptionMaker.option.length; i++) { //Clear the 2nd menu
			document.OptionMaker.Brand.options[i] = null;
		}
		for (var i = 0; i < list.length; i++) { //Repopulate 2nd menu
			document.OptionMaker.Brand.options[i] = new Option(list[i],
					listValue[i], 0, 0);
		}
	}
</script>
</head>
<body>

	<%!Films f = mbl
			.GetFilmsFromCSV("C:\\Everything\\Capita\\NovusMovieProject\\MovieDataLayer\\TestData.csv");
	//Sends csv file path to get films from csv and stores in variable f.%>


	<form name="OptionMaker">
		<p>
			<select name="option" onchange="getOptions(this.value)">
				<!-- creates drop down list -->

				<option value="">please select one</option>

				<%
					for (int i = 0; i < f.getFilms().size(); i++) {
				%>
				<option value=<%=f.getFilms().get(i).FilmID%>>
					<%=f.getFilms().get(i).FilmName%>
					<%
						}
					%>
				</option>
				<!-- Gets film name from csv file which is stored in f. Populates the dropdown list -->

		</select> <br> <br> <select id="DirectorNameList"
			name="DirectorNameList" onchange="">
			<option value="">please select one</option>
			<option name="DropDownListDirectors" value=""></option>

			<%
				for (int i = 0; i < f.getFilms().size(); i++) {
			%>
			<option value=<%=f.getFilms().get(i).Directors.get(0).DirectorName%>>
				<%=f.getFilms().get(i).Directors.get(0).DirectorName%>
				<%
					}
				%>
			</option>


		</select> 
			</select> <br> <br> <select id="ActorNameList" name="ActorNameList"
				onchange="">
				<option value="">please select one</option>
				<option name="DropDownListActors" value=""></option>

				<%
					for (int i = 0; i < f.getFilms().size(); i++) {
				%>
				<option value=<%=f.getFilms().get(i).Actors.get(0).ActorName%>>
					<%=f.getFilms().get(i).Actors.get(0).ActorName%>
					<%
						}
					%>
				</option>
				</select> <br> <br> 
				
				<button name="btnReset" onClick="window.location.reload()">Reset</button>
				
				 <br> <br> 
				
				<select name="Brand"></select>
		</p>
	</form>
</body>
</html>