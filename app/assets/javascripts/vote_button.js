$(document).ready(function(){
  $('#solution-one').click(function(event){
    var commentContent = $('#comment').val();
    event.preventDefault();
    postWinningSolution(this, commentContent);
  })
})


function postWinningSolution(solution, commentContent){
  debugger
  axios.post('/api/v1/comments', {
    comment: { winner: $(solution).attr('data-winner'),
               loser: $(solution).attr('data-loser'),
               comment: commentContent
    }
  });
}
