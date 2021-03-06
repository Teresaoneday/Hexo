var ghComment = $("#ghComment");

function formatNumber(val, len) {
    var num = "" + val;
    len = len || 2;
    while (num.length < len) {
        num = "0" + num;
    }
    return num;
}

function formatDate(str) {
    var date = new Date(str.replace(/T/, ' ').replace(/Z/, ' UTC'));
    return date.getFullYear() + '-' +
        formatNumber(date.getMonth() + 1) + '-' +
        formatNumber(date.getDate());
}

function loadComments(data) {
    for (var i = 0; i < data.length; i++) {
        var cuser = data[i].user.login;
        var cuserlink = 'https://www.github.com/' + data[i].user.login;
        var cbody = data[i].body_html;
        var cavatarlink = data[i].user.avatar_url;
        var cdate = formatDate(data[i].created_at);
        ghComment.append('<div class="comment"><div class="commentgravatar"><img src="' + cavatarlink + '"></div><div class="commentheader"><a class="commentuser" href="' + cuserlink + '" target="_blank">' + cuser + '</a><span class="commentdate">' + cdate + '</span></div><div class="commentbody">' + cbody + '</div></div>');
    }
}

$.ajax('https://api.github.com/repos/niices/niices.github.io/issues/1/comments?per_page=100', {
    headers: {
        Accept: 'application/vnd.github.full+json'
    },
    dataType: 'json',
    success: loadComments
});
