

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MovieBusinessLayer.*;
import MovieClassLayer.*;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String s; 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processResponse(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		response.getWriter().println();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		

		MovieBusinessLayer mbl = new MovieBusinessLayer();
		PrintWriter out=  response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); 
		String FilmNameList = request.getParameter("FilmNameList");
		String DirectorNameList = request.getParameter("DirectorNameList");
		String ActorNameList = request.getParameter("ActorNameList");
 
		System.out.println("FilmNameList= "+FilmNameList +"\n DirectorNameList ="+DirectorNameList+" \n ActorNameList = "+ActorNameList);
		Films Filmdata = new Films();
		List<Director> listofdi = new ArrayList();
		List<Director> listofac = new ArrayList();

		if (FilmNameList==null && DirectorNameList==null && ActorNameList==null) {
			System.out.println("everything");
			Filmdata = mbl.GetFilmsFromCSV("C:\\Everything\\Capita\\NovusMovieProject\\MovieDataLayer\\TestData.csv");

		}
		else{
			//Filmdata= 
		}
		if(FilmNameList == null || FilmNameList.equals("")){
			System.out.println(FilmNameList +"dfd");
			System.out.println("null 65");
			//FilmNameList= Filmdata.getFilms().get(0).FilmName;
			System.out.println(FilmNameList +"gf");
		}
		else
		{
			System.out.println("Film");
			 Filmdata=mbl.GetFilmSubsetByMovieID(Filmdata, FilmNameList);
		}
		if (DirectorNameList == null || DirectorNameList.equals("")) {
			System.out.println("null 73");

		}
		else{
			System.out.println("Director");

			listofdi = mbl.GetDistinctDirectorsFromFilms(Filmdata, DirectorNameList);
			System.out.println(Filmdata.getFilms().get(0).Directors.get(0).DirectorName);
		}
		if (ActorNameList == null || ActorNameList.equals("")){
			System.out.println("null 82");
		}
		else{
			System.out.println("Actor");

			Filmdata=mbl.GetFilmSubsetByActorID(Filmdata, ActorNameList);
		}
		//String b= Filmdata.getFilms().get(0).FilmID;
		request.getSession().setAttribute("Filmdatarequest", Filmdata);
		
		//String FilmNameList = request.getParameter("FilmNameList");
		//System.out.println(FilmNameList +" blah");
		//		request.getSession().setAttribute("FilmNameList", request.getParameter("FilmNameList"));	
		//		request.setAttribute("FilmNameList", FilmNameList);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
