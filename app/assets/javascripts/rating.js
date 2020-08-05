// Update stars
var starEmpty, startHalf, starFull, starsclassNameList, i
emptyStar = 'far fa-star';
halfStar = 'fas fa-star-half-alt';
fullStar = 'fas fa-star';
starsClassNameList = ["#rating-star-1 i", "#rating-star-2 i", "#rating-star-3 i", "#rating-star-4 i", "#rating-star-5 i"];

function updateStarClass(avg) {
  if ( avg == "" ) {
    for (i = 0; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg <= 1 ) {
    setFullStar(starsClassNameList[0]);
    for (i = 1; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg < 2 ) {
    setFullStar(starsClassNameList[0]);
    setHalfStar(starsClassNameList[1]);
    for (i = 2; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg == 2 ) {
    for (i = 0; i < 2; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    for (i = 2; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg < 3) {
    for (i = 0; i < 2; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    setHalfStar(starsClassNameList[2]);
    for (i = 3; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg == 3 ) {
    for (i = 0; i < 3; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    for (i = 3; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg < 4) {
    for (i = 0; i < 3; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    setHalfStar(starsClassNameList[3]);
    setEmptyStar(starsClassNameList[4]);
  } else if ( avg == 4 ) {
    for (i = 0; i < 4; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    for (i = 4; i < 5; ++i) {
      setEmptyStar(starsClassNameList[i]);
    }
  } else if ( avg <= 4.5) {
    for (i = 0; i < 4; ++i) {
      setFullStar(starsClassNameList[i]);
    }
    setHalfStar(starsClassNameList[4]);
  } else {
    for (i = 0; i < 5; ++i) {
      setFullStar(starsClassNameList[i]);
    }
  }
}

function setEmptyStar(className) {
  $(className).removeClass(halfStar, fullStar);
  $(className).addClass(emptyStar);
}
function setHalfStar(className) {
  $(className).removeClass(emptyStar, fullStar);
  $(className).addClass(halfStar);
}
function setFullStar(className) {
  $(className).removeClass(emptyStar, halfStar);
  $(className).addClass(fullStar);
}
