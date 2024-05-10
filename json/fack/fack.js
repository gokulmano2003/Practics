fetch("./fack.json")
    .then((name) => name.json())
    .then((block) => {
        var first = document.getElementById("bodyid")
        let secand = ""

        block.map((therd) => {
            secand += `<tr>
        <td>${therd.id},</td>
        <td>${therd.title}</td>
        <td>${therd.price}</td>
        <td>${therd.description}</td>
        <td>${therd.category}</td>
        <td><img style="width:30px; height:30px;" src=${therd.image}></td>
        <td>${therd.rating}</td>
        </tr>`
        })
        first.innerHTML = secand
    })