import readmore from 'readmore-js'

const initReadMore = () => {
    $('.review').readmore({ 
        speed: 75, 
        lessLink: '<a href="#">Read less</a>',
        collapsedHeight: 30
     });
}

export { initReadMore };