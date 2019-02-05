Exercise 8 - EOS BGP Configuration
==================================

1. For this exercise we will use the **eos_config** module again.

|

2. First we will need to create a new Jinja2 template.  Add the following ad save it as **bgp.j2**

    .. code-block:: text

        router bgp {{ bgp_as }}
           router-id {{ bgp_id }}
           maximum-paths 4 ecmp 4
        {% for neighbor in bgp_conf %}
           neighbor {{ neighbor.ip }} remote-as {{ neighbor.remote_as }}
        {% if bgp_as == neighbor.remote_as %}
           neighbor {{ neighbor.ip }} next-hop-self
        {% else %}
           neighbor {{ neighbor.ip }} maximum-routes 12000
        {% endif %}
        {% endfor %}
           network {{ bgp_id }}/32
           network 172.16.116.0/24

2. Create a new file with the following information, and save it as **add-bgp.yml**

    .. code-block:: yaml

        ---
        - hosts: 192.168.0.17
          gather_facts: false
          tasks:
            - name: Apply BGP Configuration to Leaf4
              eos_config:
                src: bgp.j2
                defaults: yes
                save_when: modified

|

3. Before we run this playbook, in **Terminal** let's login to see the BGP state configured on leaf4. username: arista / password: arista

    .. code-block:: text

        ssh arista@192.168.0.17
        show run | sec bgp
        show ip route
        exit

.. image:: images/bgp_1.png
    :align: center

|

4. Now within **Terminal** we will run this playbook.

    .. code-block:: text
    
        ansible-playbook add-bgp.yml
    
5. Now let's login to the switch to see if the was created.

    .. code-block:: text

        ssh arista@192.168.0.17
        show run | sec bgp
        show ip route bgp
        exit

.. image:: images/bgp_2.png
    :align: center

|



Section Complete!