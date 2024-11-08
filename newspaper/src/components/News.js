import React, { Component } from 'react';
import Newsitem from './Newsitem';
import Spinner from './Spinner';
import PropTypes from 'prop-types'
import InfiniteScroll from "react-infinite-scroll-component";

export default class News extends Component {
    static defaultProps = {
        country: 'in',
        pageSize: 5,
        category: 'general',
    };

    static propTypes = {
        country: PropTypes.string,
        pageSize: PropTypes.number,
        category: PropTypes.string,
    };
    articles = [];

    constructor() {
        super();
        this.state = {
            articles: [], // Initialize as an empty array
            loading: true,
            page: 1,
            totalResults: 0,
        };
    }
    
    async updateNews(page) {
        this.props.setProgress(10);
        let url = `https://newsapi.org/v2/top-headlines?country=${this.props.country}&apiKey=${this.props.apiKey}&page=${page}&pageSize=${this.props.pageSize}`;
        url=`https://newsapi.org/v2/top-headlines/?country=${this.props.country}&category=${this.props.category}&apiKey=${this.props.apiKey}&page=${page}&pageSize=${this.props.pageSize}`;

        this.setState({ loading: true });
        <Spinner/>
        this.props.setProgress(15);

        let data = await fetch(url);
        this.props.setProgress(30);

        let parsedData = await data.json();
        this.props.setProgress(60);

        this.setState({
            articles: parsedData.articles,

            totalResults: parsedData.totalResults,
            loading: false,
            page: page,

            
        });
        let str=this.props.category;
        let str2=str.charAt(0).toUpperCase() + str.slice(1)
        document.title=`${str2}  Quick-Read..`;

        this.props.setProgress(100);
    }

    async componentDidMount() {
        this.updateNews(1);
    }

    previous = async () => {
        this.updateNews(this.state.page - 1);
    }

    next = async () => {
        if (this.state.page + 1 <= Math.ceil(this.state.totalResults / this.props.pageSize)) {
            this.updateNews(this.state.page + 1);
        }
    };

    fetchMoreData = async () => {
        let url = `https://newsapi.org/v2/top-headlines/?country=${this.props.country}&category=${this.props.category}&apiKey=${this.props.apiKey}&page=${this.state.page}&pageSize=${this.props.pageSize}`;
        
        // this.setState({ loading: true });
    
        let data = await fetch(url);
        let parsedData = await data.json();
    
        this.setState({
            articles: this.state.articles.concat(parsedData.articles),
            totalResults: parsedData.totalResults,
            loading: false,
            page: this.state.page + 1,
        });
    };

    render() {
        let str=this.props.category;
        let str2=str.charAt(0).toUpperCase() + str.slice(1)
        return (
            <div>
                <div className="container my-3">
                    <h2 className="text-center" style={{margin:"30px 0px"}}>Quick Read - Top {str2} Headlines</h2>
               
                    {this.state.loading && <Spinner/>}
                    <div>

                    <InfiniteScroll
  dataLength={this.state.articles.length}
  next={this.fetchMoreData}
  hasMore={this.state.articles.length < this.state.totalResults} // Show spinner only if more data is available
  loader={this.state.articles.length < this.state.totalResults ? <Spinner /> : null} // Conditionally render Spinner
>
  <div className="row my-4">
    {this.state.articles.map((element) => {
      return (
        <div className="col-md-4 my-3" key={element.url}>
          <Newsitem 
            title={element.title}
            description={element.description}
            imgUrl={element.urlToImage}
            urlLink={element.url}
            author={element.author}
            publishedAt={element.publishedAt}
            source={element.source.name}
          />
        </div>
      );
    })}
  </div>
</InfiniteScroll>

            </div>

                </div>
            </div>
        );
    }
}
