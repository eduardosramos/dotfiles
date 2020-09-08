import dash
import dash_core_components as dcc
import dash_html_components as html

app = dash.Dash()

app.layout = html.Div(children=[
    html.H1(children='Dashboard em python'),
    dcc.Graph(
                id='example',
        figure={
            'data': [
                {'x': [1], 'y': [79], 'type': 'bar', 'name': 'Contemporaneo'},
                {'x': [2], 'y': [111], 'type': 'bar', 'name': 'Mio Residencial'},
                {'x': [3], 'y': [120], 'type': 'bar', 'name': 'Reserva Jardim'},
            ],
            'layout': {
                'title': 'Basic Dash Example'
            }
        }
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
