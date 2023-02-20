# The SABSA Model

[Go Back](../architecture.md)

<div class="row row-cols-md-2"><div>

The Sherwood Applied Business Security Architecture (**SABSA**) model is a six-layer security architecture framework:

1. 🗺️ **Contextual** Security Architecture <small>(the business's view)</small>: a high-level view of the business <small>(goals, objectives, risks, and requirements)</small>
2. 📃 **Conceptual** Security Architecture <small>(the architect's view)</small>: define key security domains <small>(networking, data, access control...)</small>
3. 💻 **Logical** Security Architecture <small>(the designer's view)</small>: define the logical components to protect key security domains <small>(firewall, IDS/IPS)</small>
4. 🔐 **Physical** Security Architecture <small>(the builder's view)</small>: define the physical components of the system <small>(servers, workstations, devices)</small>
5. 👛 **Component** Security Architecture <small>(the tradesman's view)</small>: select specific components/products to implement the Logical and Physical Security Architectures
6. 🔎 **Operational** Security Architecture <small>(the facilities manager's view)</small>: define processes/procedures to operate and maintain the system <small>(incident response, backups, recovery, monitoring, logging)</small>.

</div><div>

Each layer is analyzed with 6 questions: What, Why, How, Who, Where, and When, generating a 36-cell table called **SABSA Matrix**.
</div></div>