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

</head>
<body>

	<%!MovieBusinessLayer mbl = new MovieBusinessLayer();
	Films f = mbl.GetFilmsFromCSV("C:\\Everything\\Capita\\NovusMovieProject\\MovieDataLayer\\TestData.csv");
	//Sends csv file path to get films from csv and stores in variable f.%>	
	
	<%
	Films data= (Films)request.getSession().getAttribute("Filmdatarequest");
	%>



	<script type="text/javascript">
		function check(FilmNameList) {
			//var selectedText = FilmNameList.options[FilmNameList.selectedIndex].innerHTML;
			//  alert("Selected Text: " + selectedText);
			document.getElementById("btnr").click();

		}
	</script>


	<form method="post" action="Test" name="Form1">


		<!-- TODO fix the seleced -->
		<select id="FilmNameList" name="FilmNameList" onChange="check(this);">
			<!-- creates drop down list -->

			<option value="">please select one</option>

			<%
				for (int i = 0; i < data.getFilms().size(); i++) {
					out.println("<option value=" + data.getFilms().get(i).FilmID + ">" + data.getFilms().get(i).FilmName+ "</option>");
				}
			%>
			<!-- Gets film name from csv file which is stored in f. Populates the dropdown list -->


		</select> <br> <br> <select id="DirectorNameList" name="DirectorNameList" onChange="check(this);">
			<option value="">please select one</option>

			<%
				for (int i = 0; i < data.getFilms().size(); i++) {
					out.println("<option value=" + data.getFilms().get(i).Directors.get(0).DirectorID + ">"
							+ data.getFilms().get(i).Directors.get(0).DirectorName + "</option>");
				}
			%>

		</select> <br> <br> <select id="ActorNameList" name="ActorNameList" onChange="check(this);">
			<option value="">please select one</option>
			<%
				for (int i = 0; i < data.getFilms().size(); i++) {
					out.println("<option value=" + data.getFilms().get(i).Actors.get(0).ActorID + ">"
							+ data.getFilms().get(i).Actors.get(0).ActorName + "</option>");
				}
			%>
		</select> <br> <br>

		<button name="btnReset" onClick="res()">Reset</button>
		<!-- Resets drop down lists -->
		
		<script type="text/javascript">
		function res(FilmNameList) {
			for (var i = 0; i < document.Form1.option.length; i++) { //Clear the 2nd menu
				document.Form1.FilmNameList.options[i] = null;
			}
		}
	</script>
		
		<button id="btnr" name="btnr" onClick="Test" hidden="hidden">r</button>

		<%=request.getParameter("FilmNameList")%>

		<%
			//Getting the data from GetDistinctSimplisticFilmFromFilms
			//MovieBusinessLayer t = new MovieBusinessLayer();
			//String s = request.getParameter("FilmNameList");
			//List<SimplisticFilm> g = t.GetDistinctSimplisticFilmFromFilms(f, s);
			//out.print(g.get(0).FilmName);
		%>
	</form>


</body>
</html>