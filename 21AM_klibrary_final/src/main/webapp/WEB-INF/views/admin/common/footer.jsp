<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

        // navigation 이벤트

        $(function () {

            const naviList = $("#lefNavList").children();
            const options = $(".navOptions")

            $(naviList).click((e) => {
                $(naviList).children().not('i').hide();
                $(naviList).children().filter('i').attr("class", "fas fa-plus");
                $(options).children().css({ "font-size": "15px", "backgroundColor": "#9BC3FF", "fontWeight": "normal" });
                $(e.target).find("ul").show();
                $(e.target).find("i").attr("class", "fas fa-minus");
            })

            // navigation - option 이벤트 
            $(options).find('li').hover((e)=>{
            	$(e.target).css("textDecoration", "underline");
            },(e)=>{
            	$(e.target).css("textDecoration", "");
            })

            // 부모 상속 이벤트 중단 
            $(options).click((e) => {
				e.stopPropagation();
                /* $(options).children().css({ "font-size": "15px", "backgroundColor": "#9BC3FF", "fontWeight": "normal" });
                $(e.target).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" }); */
            })

        })
	
     	// check button 
        const fn_selBox =()=>{
        	const checkBoxs = $("input:checkbox[name=checkFl]");
        	// uncheck -> check 
        	if($("#selBox").is(":checked")){
        		$.each(checkBoxs,function(i,v){
        			$(v).prop("checked",true);
        		})
        	} else {
        		$.each(checkBoxs,function(i,v){
        			$(v).prop("checked",false);
        		})
        	}
        }

    </script>



</body>

</html>

