// One should load all comments on the page before executing the script
const comments = [...document.getElementsByClassName("commentsList__item")];
const commentsContainer = document.getElementsByClassName("commentsList")[0]
                                  .getElementsByClassName("lazyLoadingList__list")[0];

function getCommentTs(comment) {
    return comment.getElementsByClassName("commentItem__timestampLink")[0].text;
}

comments.sort((left, right) => {
    let leftC = getCommentTs(left);
    let rightC = getCommentTs(right);

    return leftC.length < rightC.length
        ? -1
        : (leftC.length == rightC.length ? leftC.localeCompare(rightC) : 1);
});

for (const comment of comments) {
    const parent = comment.parentElement;
    if (parent) {
        parent.removeChild(comment);
    }
}

for (const comment of comments) {
    commentsContainer.append(comment);
}
