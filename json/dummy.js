 var pizza=new Promise((resolve, reject) => {
    var status=true
     if(status){
        setTimeout(()=>{
            resolve("pizza Delivery")
        },3000)
        
     }else{
        reject("not reeched")
     }
})

async function name(){
    console.log("entries point")
    try{
        const res=await pizza
         console.log(res)
    }catch(Error){
         console.log(Error)
    }
    console.log("exit point")
}

name()

