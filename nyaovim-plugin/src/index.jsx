/*global Polymer hljs*/

import * as React from 'react';
import * as ReactDOM from 'react-dom';
import marked from 'marked';

marked.setOptions({
    highlight: function(code, lang) {
        if (lang === undefined) {
            return code;
        }
        try {
            return hljs.highlight(lang, code).value;
        } catch (e) {
            return code;
        }
    }
});

class MarkdownPreview extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            contents: ''
        };
    }

    componentDidMount() {
        const c = this.props.editor.getClient();
        this.listener = c.on('notification', (method, args) => {
            switch (method) {
            case 'markdown-preview:update': {
                this.setState({ contents: marked(args[0]) });
                this.props.editor.screen.checkShouldResize();
                break;
            }
            case 'markdown-preview:dismiss': {
                this.setState({ contents: '' });
                break;
            }
            default:
                break;
            }
        });
        c.subscribe('markdown-preview:update');
        c.subscribe('markdown-preview:dismiss');
    }

    componentWillUnmount() {
        const c = this.props.editor.getClient();
        c.removeListener('notification', this.listener);
        c.unsubscribe('markdown-preview:update');
        c.unsubscribe('markdown-preview:dismiss');
    }

    render() {
        return (
            <div
                className="markdown-body"
                dangerouslySetInnerHTML={{
                    __html: this.state.contents
                }}
            />
        );
    }
}

Polymer({
    is: 'markdown-preview',

    properties: {
        width: Number,
        editor: Object
    },

    ready: function() {
        ReactDOM.render(
            <MarkdownPreview editor={this.editor}/>,
            document.getElementById('markdown-root')
        );
    }
});

