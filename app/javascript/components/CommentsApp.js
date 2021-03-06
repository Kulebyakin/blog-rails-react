import React from "react"
import Comments from './Comments';
import CommentsForm from './CommentsForm';

class CommentsApp extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      comments: props.comments,
      replies: props.replies
    }

    this.handleSubmitComment = this.handleSubmitComment.bind(this);
  }
  
  render () {
    return (
      <div>
        <div id="comment_error"></div>
        <Comments comments={this.state.comments} post_id={this.props.post_id} replies={this.state.replies} csrf_token={this.props.csrf_token} />
        <CommentsForm csrf_token={this.props.csrf_token} onSubmit={this.handleSubmitComment} />
      </div>
    );
  }

  handleSubmitComment(comment) {
    var comments = this.state.comments;

    $.ajax({
      url: "/comments/create/" + this.props.post_id ,
      datatype: 'json',
      type: 'POST',
      data: comment,
      success: function(data) {
        $('div#comment_error').html('');
        if (data.errors != null && !jQuery.isEmptyObject(data.errors)) {
          for (var error of data.errors['body']) {
            $('div#comment_error').append(
              '<div class="alert alert-danger alert-dismissible fade show" role="alert">' + error + 
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
          }
        } else {
          $('div#comment_error');
          var updatedComments = comments.concat([data.comment]);
          this.setState({comments: updatedComments});
        }
      }.bind(this),
      error: function(xhr, status, err) {
        console.error('/comments/create/' + this.props.post_id, status, err.toString());
      }.bind(this)
    });
  }
}

export default CommentsApp
