const fetchnews = (lecture) => {
    const url = `/public/news/${lecture}.json`
    $.getJSON(url, news => {
        if (news.length > 0) {
            let newsContent = '<h3>Aktuelles:</h3>'
            for (let entry of news) {
                newsContent +=
                    `<div class="row">
                        <div class="col-md-3">${entry.date}</div>
                        <div class="col-md-9">${entry.subject}</div>
                    </div>`
            }
            newsContent += '<hr>'
            $('#news').html(newsContent)
        }
    })
}