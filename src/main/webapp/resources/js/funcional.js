//(function() {
//
//    var graph = new joint.dia.Graph;
//    var paper = new joint.dia.Paper({ el: $('#paper-html-elements'), width: 650, height: 400, gridSize: 1, model: graph });
//
////    alert('alerta into');
//    
//    
//// Create a custom element.
//// ------------------------
//
//    joint.shapes.html = {};
//    joint.shapes.html.Element = joint.shapes.basic.Rect.extend({
//        defaults: joint.util.deepSupplement({
//            type: 'html.Element',
//            attrs: {
//                rect: { stroke: 'none', 'fill-opacity': 0 }
//            }
//        }, joint.shapes.basic.Rect.prototype.defaults)
//    });
//
//// Create a custom view for that element that displays an HTML div above it.
//// -------------------------------------------------------------------------
//
//    joint.shapes.html.ElementView = joint.dia.ElementView.extend({
//
//        template: [
//            '<div class="html-element">',
//            '<button class="delete">x</button>',
//            '<label>daddadaddajs</label>',
//            '<span></span>', '<br/>',
//            '<select><option>--</option><option>one</option><option>two</option></select>',
//            '<input type="text" value="PCS Bussiness Oisas" />',
//            '</div>'
//        ].join(''),
//
//        initialize: function() {
//            _.bindAll(this, 'updateBox');
//            joint.dia.ElementView.prototype.initialize.apply(this, arguments);
//
//            this.$box = $(_.template(this.template)());
//            // Prevent paper from handling pointerdown.
//            this.$box.find('input,select').on('mousedown click', function(evt) {
//                evt.stopPropagation();
//            });
//            // This is an example of reacting on the input change and storing the input data in the cell model.
//            this.$box.find('input').on('change', _.bind(function(evt) {
//                this.model.set('input', $(evt.target).val());
//            }, this));
//            this.$box.find('select').on('change', _.bind(function(evt) {
//                this.model.set('select', $(evt.target).val());
//            }, this));
//            this.$box.find('select').val(this.model.get('select'));
//            this.$box.find('.delete').on('click', _.bind(this.model.remove, this.model));
//            // Update the box position whenever the underlying model changes.
//            this.model.on('change', this.updateBox, this);
//            // Remove the box when the model gets removed from the graph.
//            this.model.on('remove', this.removeBox, this);
//
//            this.updateBox();
//        },
//        render: function() {
//            joint.dia.ElementView.prototype.render.apply(this, arguments);
//            this.paper.$el.prepend(this.$box);
//            this.updateBox();
//            return this;
//        },
//        updateBox: function() {
//            // Set the position and dimension of the box so that it covers the JointJS element.
//            var bbox = this.model.getBBox();
//            // Example of updating the HTML with a data stored in the cell model.
//            this.$box.find('label').text(this.model.get('label'));
//            this.$box.find('span').text(this.model.get('select'));
//            this.$box.css({
//                width: bbox.width,
//                height: bbox.height,
//                left: bbox.x,
//                top: bbox.y,
//                transform: 'rotate(' + (this.model.get('angle') || 0) + 'deg)'
//            });
//        },
//        removeBox: function(evt) {
//            this.$box.remove();
//        }
//    });
//
//// Create JointJS elements and add them to the graph as usual.
//// -----------------------------------------------------------
//
//    var el1 = new joint.shapes.html.Element({
//        position: { x: 80, y: 80 },
//        size: { width: 170, height: 100 },
//        label: 'Bussiness Service',
//        select: 'one'
//    });
//    var el2 = new joint.shapes.html.Element({
//        position: { x: 370, y: 160 },
//        size: { width: 170, height: 100 },
//        label: 'BussinessComponent',
//        select: 'two'
//    });
//    var l = new joint.dia.Link({
//        source: { id: el1.id },
//        target: { id: el2.id },
//        attrs: { '.connection': { 'stroke-width': 5, stroke: '#34495E' } }
//    });
//
//    graph.addCells([el1, el2, l]);
//
//}())
//
//var graph = new joint.dia.Graph;
//var paper = new joint.dia.Paper({
//    el: $('#paper'),
//    width: 650, height: 200, gridSize: 1,
//    model: graph,
//    defaultLink: new joint.dia.Link({
//        attrs: { '.marker-target': { d: 'M 10 0 L 0 5 L 10 10 z' } }
//    }),
//    validateConnection: function(cellViewS, magnetS, cellViewT, magnetT, end, linkView) {
//        // Prevent linking from input ports.
//        if (magnetS && magnetS.getAttribute('type') === 'input') return false;
//        // Prevent linking from output ports to input ports within one element.
//        if (cellViewS === cellViewT) return false;
//        // Prevent linking to input ports.
//        return magnetT && magnetT.getAttribute('type') === 'input';
//    },
//    validateMagnet: function(cellView, magnet) {
//        // Note that this is the default behaviour. Just showing it here for reference.
//        // Disable linking interaction for magnets marked as passive (see below `.inPorts circle`).
//        return magnet.getAttribute('magnet') !== 'passive';
//    }
//});
//
//var m1 = new joint.shapes.devs.Model({
//    position: { x: 50, y: 50 },
//    size: { width: 90, height: 90 },
//    inPorts: ['in1','in2'],
//    outPorts: ['out'],
//    attrs: {
//        '.label': { text: 'Model', 'ref-x': .4, 'ref-y': .2 },
//        rect: { fill: '#2ECC71' },
//        '.inPorts circle': { fill: '#16A085', magnet: 'passive', type: 'input' },
//        '.outPorts circle': { fill: '#E74C3C', type: 'output' }
//    }
//});
//graph.addCell(m1);
//
//var m2 = m1.clone();
//m2.translate(300, 0);
//graph.addCell(m2);
//m2.attr('.label/text', 'Model 2');
//
