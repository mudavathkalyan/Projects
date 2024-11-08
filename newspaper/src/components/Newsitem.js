import React, { Component } from 'react'

export default class Newsitem extends Component {
  render(props) {
    let {title,description,imgUrl,urlLink,author,publishedAt,source}=this.props;
    return (
      <div>
              
            <div className="card" >
            <img src={!imgUrl?"data:image/png;base64,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":imgUrl} 
            className="card-img-top" 
            alt="Img"
            style={{ height: "25vh" }}
            />
            <div className="card-body" >
              
            <h5 className="card-title">{!title?title:title.slice(0,60)}<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    {source}
    <span class="visually-hidden"></span>
  </span>
</h5>

            <p className="card-text">{!description?"Unable to feth the description due to some issuse,to explore  more please click the provided button i.e read more.....":description.slice(0,150)}</p>

            <p className="card-text"><small>By Author-{!author?"Unknown":author},On {new Date(publishedAt).toDateString()}</small></p>
            <a href={urlLink} target="_blank" className="btn btn-primary btn-sm">Read More</a>
    </div>
</div>
      </div>
    )
  }
}
