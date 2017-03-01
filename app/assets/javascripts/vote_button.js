$(document).ready(function(){
  $('#solution-one').click(function(event){
    var commentContent = $('#comment').val();
    event.preventDefault();
    postWinningSolution(this, commentContent);
    removeFromSolutions(this);
  })
  $('#solution-two').click(function(event){
    var commentContent = $('#comment').val();
    event.preventDefault();
    postWinningSolution(this, commentContent);
    removeFromSolutions(this);
  })

  $('#ruby').click(function(event){
    event.preventDefault();
    loadObjects(this);
  })
})

function postWinningSolution(solution, commentContent){
  axios.post('/api/v1/comments', {
    comment: { winner: $(solution).attr('data-winner'),
               loser: $(solution).attr('data-loser'),
               comment: commentContent
    }
  });
  location.reload();
}

// function removeFromSolutions(solution){
//
//   axios.post('/remove', {
//               winner: $(solution).attr('data-winner'),
//               loser: $(solution).attr('data-loser')
//   });
// }
