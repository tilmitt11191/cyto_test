
# -*- coding: utf-8 -*-



from py2cytoscape.data.cyrest_client import CyRestClient

cy = CyRestClient(ip='127.0.0.1', port=1234)

#style_for_widget = cy.style.get_all()
#print(style_for_widget)

#style = cy.style.get('metro','cytoscapejs')
#print(style)

networks = cy.network.get_all(format='json')

import py2cytoscape.cytoscapejs as renderer
renderer.render(networks, 'Directed', background='radial-gradient(#FFFFFF 15%, #DDDDDD 105%)')
#view = g_cy.get_first_view()
# style_for_widget = cy.style.get(my_yeast_style.get_name(), data_format='cytoscapejs')
#renderer.render(view, 'Directed', background='radial-gradient(#FFFFFF 15%, #DDDDDD 105%)')

