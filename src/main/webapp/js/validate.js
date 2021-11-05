
    function isValidate(obj){
        
        if(obj.id.value==""){
            alert("아이디를 입력하세요.");
            obj.id.focus();
            return false;
        }
        if(frmObj.pwd.value.length==0){
            alert("비밀번호를 입력하세요.");
            frmObj.pwd.focus();
            return false;
        }
        if(frmObj.pwd2.value.length==0){
            alert("비밀번호 확인을 입력하세요.");
            frmObj.pwd2.focus();
            return false;
        }
        else{
            if(obj.pwd.value!=obj.pwd2.value){
            alert("비밀번호가 일치하지 않습니다.");
            frmObj.pwd2.focus();
            return false; 
            }
        }
        var isGender = false;
        /*
        for(var i=0;i<obj.gender.length;i++){
            if(obj.gender[i].checked){
                isGender=true;
                break;
            }
        }
        if(!isGender){
            alert("성별을 선택하세요");
            obj.gender[0].focus();
            return false;
        }
        */
       obj.gender.forEach(function(element){
        if(element.checked)
           isGender=true;
       });
       if(!isGender){
            alert("성별을 선택하세요");
            obj.gender[0].focus();
            return false;
        }

        var checked = 0;
        var notChecked=[];
        for(var i=0;i<obj.inter.length;i++){
            if(obj.inter[i].checked){ 
                checked+=1; 
            }
            else notChecked.push(i);
        }
        if(checked<3){
            alert("관심항목을 3개 이상 선택하세요");
            obj.inter[notChecked[0]].focus();
            return false;
        }

        if(obj.grade.selectedIndex==0){
            alert("최종학력을 선택하세요.");
            obj.grade.focus();
            return false;
        }

        if(obj.file.value==''){
            alert("파일을 첨부하세요.");
            obj.file.focus();
            return false;
        }

        if(obj.self.value.length==0){
            alert("자기소개를 입력하세요.");
            obj.self.focus();
            return false;
        }
        return true;
    }

    function fnNoSubmitButton(obj){
        console.log(obj);
        if(obj===undefined) //obj가 폼 객체가 아닌 경우
        obj = document.forms[0];
        if(isValidate(obj)) obj.submit();
    }