import React from 'react';



class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            tabID: 0
        };

    }

    render() {
        return (
            <div>
                <ul>
                    <li>
                        <h1>Tabs</h1>
                    </li>
                    <li>
                        <h1>Tabs</h1>
                    </li>
                    <li>
                        <h1>Tabs</h1>
                    </li>
                </ul>
                <article>

                </article>
            </div>
        );
    }
}
export default Tabs;