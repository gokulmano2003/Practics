fetch('https://fakestoreapi.com/products')
.then((res)=>res.json())
.then((ser)=>{
var body=document.getElementById("bodyid")

let data=""

ser.map((mapping)=>{

    data+=`<tr>
    <td>${mapping.id}</td> 
    <td>${mapping.title}</td>
    <td><img style="width:20px; height:20px;" src=${mapping.image}></td>
    <td>${mapping.price}</td>
    <td>${mapping.description}</td>
    <td>${mapping.rating}</td>
    </tr>`
})

body.innerHTML=data
})
