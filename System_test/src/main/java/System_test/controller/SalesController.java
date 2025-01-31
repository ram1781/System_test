package System_test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import System_test.dao.ItemDao;
import System_test.dao.SalesDao;
import System_test.dto.Items;
import System_test.dto.Orders;

@Controller
public class SalesController {

    @Autowired
    SalesDao dao;
    
    @Autowired
    ItemDao itemDao;

 /* @PostMapping("/save")
  public ModelAndView saveOrder(@ModelAttribute Orders order)
  {
  	try {
  		Orders l1=dao.save(order);
  		if(l1!=null)
  		{
  			String s="items added Successfully";
  			ModelAndView view=new ModelAndView("index.jsp");
  			view.addObject("s",s);
  			return view;
  		}
  	} catch (Exception e) {
//  		String s1="error";
//  		ModelAndView view=new ModelAndView("add_item.jsp");
//  		view.addObject("s1",s1);
//  		return view;
  		e.printStackTrace();
  	}
  	return null;
  	
  }
  @RequestMapping("/saveitms")
  public ModelAndView saveItems(@ModelAttribute Item item)
  {
	  try {
		  Item i=itemDao.save(item);
		  if(i!=null)
		  {
			  ModelAndView view=new ModelAndView("add_item.jsp");
			  return view;
		  }
		  
		}catch (Exception e) {

e.printStackTrace();
	  }
	  return null;
  }*/
    
    @PostMapping("/save")
    public ModelAndView saveOrder(@ModelAttribute Orders order) {
        try {
            Orders savedOrder = dao.save(order);
            if (savedOrder != null) {
               // String successMessage = "Items added successfully!";
                ModelAndView view = new ModelAndView("index.jsp");
                view.addObject("s", savedOrder);
                return view;
            }
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView view = new ModelAndView("error.jsp");
            return view;
        }
        return null;
    }

    @RequestMapping("/saveitems")
    public ModelAndView saveItems(@ModelAttribute Items item) {
        try {
            Items savedItem = itemDao.save(item);
            if (savedItem != null) {
                ModelAndView view = new ModelAndView("add_item.jsp");
                return view;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
  
}


