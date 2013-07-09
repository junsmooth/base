package org.bgrimm.service.system;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Service;

@Service("topoService")
public class TopoService {

	public String uploadFile(HttpServletRequest req, HttpServletResponse resp) {


		  try {
			   req.setCharacterEncoding("UTF-8");
			  } catch (Exception e1) {
			   e1.printStackTrace();
			  }   
  
			        String newfileName ="main"; //sdfFileName.format(date);//文件名称    
			        String fileRealPath = "";//文件存放真实地址    
			           
			        String fileRealResistPath = "";//文件存放真实相对路径    
			           
			        //名称  界面编码 必须 和request 保存一致..否则乱码    
			        String name = req.getParameter("name");   
			          if(name == null || name.isEmpty()) 
			          {
			           name =req.getParameter("fileName");
			          }
			            
			        String firstFileName="";   
			        // 获得容器中上传文件夹所在的物理路径    
			        String savePath=req.getSession().getServletContext().getRealPath("/")+"resources/custom/images\\";
			        System.out.println("路径" + savePath+"; name:"+name);   
			        File file = new File(savePath);   
			        if (!file.isDirectory()) {   
			            file.mkdirs();   
			        }   
			        try {   
			            DiskFileItemFactory fac = new DiskFileItemFactory(); 
			            //设置当内容大于内存缓冲区的域值时，设置文件的存储位置。
			            ServletFileUpload upload = new ServletFileUpload(fac);
			            upload.setHeaderEncoding("UTF-8");   
			            // 获取多个上传文件    
			            List fileList = upload.parseRequest(req);   
			            // 遍历上传文件写入磁盘    
			            Iterator it = fileList.iterator();   
			            while (it.hasNext()) {   
			                Object obit = it.next(); 
			                if(obit instanceof DiskFileItem){ 
			                    DiskFileItem item = (DiskFileItem) obit;   
			                       
			                    // 如果item是文件上传表单域       
			                    // 获得文件名及路径       
			                    String fileName = item.getName();   
			                    if (fileName != null) {   
			                       firstFileName=item.getName().substring(item.getName().lastIndexOf("/")+1);   
			                        String formatName = firstFileName.substring(firstFileName.lastIndexOf("."));//获取文件后缀名    
			                        fileRealPath = savePath + newfileName+ formatName;//文件存放真实地址    
			                           
			                        BufferedInputStream in = new BufferedInputStream(item.getInputStream());// 获得文件输入流    
			                        BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileRealPath)));// 获得文件输出流    
			                        Streams.copy(in, outStream, true);// 开始把文件写到你指定的上传文件夹    
			                            
			                    }    
			                } 
			            }    
			        } catch (org.apache.commons.fileupload.FileUploadException ex) { 
			          ex.printStackTrace();   
			           System.out.println("没有上传文件");   
			        } catch (IOException e) {
			   e.printStackTrace();
			  } 
			        return null;
	}

}
