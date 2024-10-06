//These are constants

let over=new Audio("gameover.mp3");
let bgsound=new Audio("gamebackground.mp3");
let eat=new Audio ("eat.mp3");

let snakedir={x:0,y:0};
let speed=6;
let lastPaintTime=0;
let score=0;
let snakeArr=[{x:18,y:12}];//snake array position
let food={x:3,y:10};//food obj position initially
bgsound.play();
let board=document.querySelector(".board");
document.querySelector("#scorebord").innerHTML=`Score:0`;

bgsound.play();

document.querySelector('#highscore').innerHTML=`Highscore=${localStorage.getItem("topscore")}`;

//game atctual function
function main(ctime)
{
    window.requestAnimationFrame(main);//work like a  loop i.e like a set timeout function
    // console.log(ctime);
    if((ctime-lastPaintTime)/1000 < 1/speed )
        return ;
    lastPaintTime=ctime;
    gameEngine();
}
//game over condition
function isColoide(snake)
{
    for(let i=1;i<snakeArr.length;i++)
        {
            if(snake[i].x === snake[0].x && snake[i].y === snake[0].y)
                return true;
        }
        if(snake[0].x>=31|| snake[0].x<=0 || snake[0].y>=31 || snake[0].y<=0)
            return true;
}
//game functioning
function gameEngine()
{

    //if touches border
    if(isColoide(snakeArr))
        {
            over.play();
            bgsound.pause();
            snakedir={x:0,y:0};
            document.querySelector('#highscore').innerHTML=`High-score:${localStorage.getItem("topscore")}`;
            speed=6;
            alert("Game Over.press any key to Start...");
            window.location.reload();
            snakeArr=[{x:18,y:12}];
            bgsound.play();
            score=0;
        }
        //increaseing snake size when food eatten..
        if(snakeArr[0].y==food.y && snakeArr[0].x==food.x)
            {
                score+=3;
                if(score>localStorage.getItem('topscore'))
                    localStorage.setItem("topscore",score);
                speed+=0.4;

                document.querySelector("#scorebord").innerHTML=`Score:${score}`;
                eat.play();
                snakeArr.unshift({x:snakeArr[0].x +snakedir.x, y:snakeArr[0].y+snakedir.y});
                let a=1;
                let b=30;
                //food generation after eaten by snake
                food={x:Math.round(a+(b-1)*Math.random()), y:Math.round(a+(b-1)*Math.random())};
            }
            //snake movement
    for(let i=snakeArr.length-2;i>=0;i-- )
        {
            snakeArr[i+1]={...snakeArr[i]};
        }
        snakeArr[0].x+=snakedir.x;
        snakeArr[0].y+=snakedir.y;
        
        
        board.innerHTML="";
        //snake body
        snakeArr.forEach((e,index)=>
    {
        let snakeElement=document.createElement('div');
        snakeElement.style.gridRowStart=e.y;
        snakeElement.style.gridColumnStart=e.x;
        snakeElement.classList.add('snake');
        board.appendChild(snakeElement);
        if(index==0)
            {
                snakeElement.classList.add('head');   
            }
            board.appendChild(snakeElement);
        });
        
        //snake food
        let foodElement=document.createElement('div');
        foodElement.style.gridRowStart=food.y;
        foodElement.style.gridColumnStart=food.x;
        foodElement.classList.add('food');
        board.appendChild(foodElement);
        
        
    }
    
    //main logic  --->very imp
    window.requestAnimationFrame(main);

    //buttons action
    window.addEventListener('keydown',e=>{
        let highscore=localStorage.getItem('topscore');
        snakedir={x:0,y:1};
        bgsound.play();
        switch(e.key)
        {
            case 'ArrowUp':
                snakedir.x=0;
                snakedir.y=-1;
                break;
            case 'ArrowDown':
                snakedir.x=0;
                snakedir.y=1;
                break;
            case 'ArrowLeft':
                snakedir.x=-1;
                snakedir.y=0;
                break;
            case 'ArrowRight':
                snakedir.x=1;
                snakedir.y=0;
                break;
            default:break;
        }
});
