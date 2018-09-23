const fetchnews = (lecture) => {
    const url = `/public/news/${lecture}.json`
    $.getJSON(url, news => {
        if (news.length > 0) {
            let newsContent = '<h3>Aktuelles:</h3>'
            for (let index in news) {
                if (index >= 3) break
                const entry = news[index]
                newsContent +=
                    `<div class="row">
                        <div class="col-md-3">${entry.date}</div>
                        <div class="col-md-9">${entry.subject}</div>
                    </div>`
            }
            if (news.length > 3) {
                newsContent +=
                    `<div class="row">
                        <div class="col-md-3">
                            <a href="/public/news/${lecture}.json">ältere Infos</a>
                        </div>
                        <div class="col-md-9"></div>
                    </div>`                
            }
            newsContent += '<hr>'
            $('#news').html(newsContent)
        }
    })
}