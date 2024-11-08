//https://api.openweathermap.org/data/2.5/weather?q=mumbai&appid=3fd0b498e49b81c5a9e4285f1dd2e420&units=metric

let apiurl="https://api.openweathermap.org/data/2.5/weather?units=metric&q=";
let apikey="3fd0b498e49b81c5a9e4285f1dd2e420";
let city=document.querySelector('#cityname');

async function weather(city)
{
        let response=await fetch(apiurl+city+`&appid=${apikey}`);
        let data=await response.json();
        document.querySelector('.city').innerHTML=data.name;
        let t1=Math.round(data.main.temp);
        let temp=document.querySelector('.temp').innerHTML=t1+`°C`;
        document.querySelector('.humid').innerHTML=data.main.humidity+`%`;
        document.querySelector('.wind').innerHTML=data.wind.speed+`Km/h`;
        let img=document.querySelector('#weatherimage');
        if(t1<15)
        {
                img.src="rain.png";
        }
        else if(t1<20&& t1>15)
        {
                img.src="storm.png";
        }
        else if(t1>20 && t1<30)
        {
                img.src="cloudy.png";

        }
        else if(t1>30)
        {
                img.src="sun.png";
        }
        console.log(data);
} 
let searchbtn=document.querySelector('#searchaction');
searchbtn.addEventListener('click',()=>
{

        weather(city.value);
        city.value="";
});