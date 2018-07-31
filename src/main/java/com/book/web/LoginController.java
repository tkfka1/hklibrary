package com.book.web;

import com.book.domain.Admin;
import com.book.domain.ReaderCard;
import com.book.domain.ReaderInfo;
import com.book.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

//Spring mvc Controller
@Controller
public class LoginController {

    private LoginService loginService;


    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    //login.html 요청 처리 책임
    @RequestMapping(value = {"/","/login.html"})
    public String toLogin(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }
    @RequestMapping("/logout.html")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login.html";
    }


    // loginCheck.html 요청 처리 책임
    // 요청 매개 변수는 매개 변수 이름 기본 계약에 따라 해당 메서드에 자동으로 바인딩됩니다.
    @RequestMapping(value = "/api/loginCheck", method = RequestMethod.POST)
    public @ResponseBody Object loginCheck(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        String passwd = request.getParameter("passwd");
                boolean isReader = loginService.hasMatchReader(id, passwd);
                boolean isAdmin = loginService.hasMatchAdmin(id, passwd);
        HashMap<String, String> res = new HashMap<String, String>();
                if (isAdmin==false&&isReader==false) {
                    res.put("stateCode", "0");
                    res.put("msg","계정 또는 암호가 잘못되었습니다.");
                } else if(isAdmin){
                    Admin admin=new Admin();
                    admin.setAdminId(id);
                    admin.setPassword(passwd);
                    request.getSession().setAttribute("admin",admin);
                    res.put("stateCode", "1");
                    res.put("msg","관리자가 성공적으로 로그인했습니다.");
                }else {
                    ReaderCard readerCard = loginService.findReaderCardByUserId(id);
                    request.getSession().setAttribute("readercard", readerCard);
                    res.put("stateCode", "2");
                    res.put("msg","사용자가 성공적으로 로그인했습니다.");
                }
        return res;
    };
    @RequestMapping("/admin_main.html")
    public ModelAndView toAdminMain(HttpServletResponse response) {

            return new ModelAndView("admin_main");
    }


    @RequestMapping("/reader_main.html")
    public ModelAndView toReaderMain(HttpServletResponse response) {

        return new ModelAndView("reader_main");
    }



    @RequestMapping("/admin_repasswd.html")
    public ModelAndView reAdminPasswd() {

        return new ModelAndView("admin_repasswd");
    }

    @RequestMapping("/admin_repasswd_do")
    public String reAdminPasswdDo(HttpServletRequest request,String oldPasswd,String newPasswd,String reNewPasswd,RedirectAttributes redirectAttributes ) {

        Admin admin=(Admin) request.getSession().getAttribute("admin");
        int id=admin.getAdminId();
        String passwd=loginService.getAdminPasswd(id);

        if(passwd.equals(oldPasswd)){
            boolean succ=loginService.adminRePasswd(id,newPasswd);
            if (succ){

                redirectAttributes.addFlashAttribute("succ", "비밀번호가 성공적으로 수정되었습니다！");
                return "redirect:/admin_repasswd.html";
            }
            else {
                redirectAttributes.addFlashAttribute("error", "비밀번호 수정 실패！");
                return "redirect:/admin_repasswd.html";
            }
        }else {
            redirectAttributes.addFlashAttribute("error", "이전 비밀번호 오류！");
            return "redirect:/admin_repasswd.html";
        }
    };

    //404 페이지 구성
     @RequestMapping("*")
     public String notFind(){
     return "404";
       }


}