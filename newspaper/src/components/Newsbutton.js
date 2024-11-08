import React, { Component } from 'react';
import Newsitem from './Newsitem';
import Spinner from './Spinner';
import PropTypes from 'prop-types'


export default class Newsbutton extends Component {
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
            articles: [],
            loading: false,
            page: 1,
            totalResults: 0,
        };
    }
    
    async updateNews(page) {
        let url = `https://newsapi.org/v2/top-headlines?country=${this.props.country}&apiKey=78750248815e41b28f05f3d209763587&page=${page}&pageSize=${this.props.pageSize}`;
        url=`https://newsapi.org/v2/top-headlines/?country=${this.props.country}&category=${this.props.category}&apiKey=78750248815e41b28f05f3d209763587&page=${page}&pageSize=${this.props.pageSize}`;

        this.setState({ loading: true });
        <Spinner/>
        let data = await fetch(url);
        let parsedData = await data.json();
        this.setState({
            articles: parsedData.articles,

            totalResults: parsedData.totalResults,
            loading: false,
            page: page,
        });

        let str=this.props.category;
        let str2=str.charAt(0).toUpperCase() + str.slice(1)
        document.title=`${str2}  Quick-Read..`;
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
    }

    render() {
        let str=this.props.category;
        let str2=str.charAt(0).toUpperCase() + str.slice(1)
        return (
            <div>
                <div className="container my-3">
                    <h2 className="text-center" style={{margin:"30px 0px"}}>Quick Read - Top {str2} Headlines</h2>
               
                    {this.state.loading && <Spinner/>}

                    <div className="row my-4">
                        {!this.state.loading  && this.state.articles.map((element) => {
                            return (
                                <div className="col-md-4 my-3" key={element.url}>
                                    <Newsitem title={element.title} description={element.description} 
                                    imgUrl={element.urlToImage} urlLink={element.url} author={element.author} 
                                    publishedAt={element.publishedAt} source={element.source.name} />
                                </div>
                            );
                        })}
                    </div>
                    <div className='container d-flex justify-content-between'>
                        <button type="button" disabled={this.state.page <= 1} onClick={this.previous} className="btn btn-dark">&larr; Previous</button>
                        <button type="button" disabled={this.state.page + 1 > Math.ceil(this.state.totalResults / this.props.pageSize)} onClick={this.next} className="btn btn-dark">Next &rarr;</button>
                    </div>
                </div>
            </div>
        );
    }
}
