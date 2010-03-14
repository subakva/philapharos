$(function() {

  $('#loading').ajaxStart(function(){
    $(this).show();
  }).ajaxStop(function(){
    $(this).hide();
  }).ajaxError(function() {
    $(this).hide();
    alert('There was problem with the request. Please try again later.')
  });
  
  $('#draw_pie').click(function() {
    var project_id = $('#project_chooser').val();
    if (project_id == '0') {
      alert('Please choose a project.')
    } else {
      // get the project details that we want to draw via ajax

      var url = '/lighthouse_accounts/1/lighthouse_projects/' + project_id + '.json';

      $.get(url, {}, function(data, status, xhr) {

        // put the bars in the pie hole
        // var pie_hole = $('#pie_hole');
        // var r = Raphael(pie_hole.offset().left, pie_hole.offset().top, 600, 400);
        // var fin = function () {
        //         this.flag = r.g.popup(this.bar.x, this.bar.y, this.bar.value || "0").insertBefore(this);
        //     },
        //     fout = function () {
        //         this.flag.animate({opacity: 0}, 300, function () {this.remove();});
        //     },
        //     fin2 = function () {
        //         var y = [], res = [];
        //         for (var i = this.bars.length; i--;) {
        //             y.push(this.bars[i].y);
        //             res.push(this.bars[i].value || "0");
        //         }
        //         this.flag = r.g.popup(this.bars[0].x, Math.min.apply(Math, y), res.join(", ")).insertBefore(this);
        //     },
        //     fout2 = function () {
        //         this.flag.animate({opacity: 0}, 300, function () {this.remove();});
        //     };
        // r.g.txtattr.font = "12px 'Fontin Sans', Fontin-Sans, sans-serif";
        // r.g.text(160, 10, "Tickers By Milestone");
        // r.g.barchart(10, 10, 300, 220, [data['ticket_counts']]).hover(fin, fout);

        // // make pie!
        var pie_hole = $('#pie_hole');
        var paper = Raphael(pie_hole.offset().left, pie_hole.offset().top, 600, 400);
        paper.g.txtattr.font = "12px 'Fontin Sans', Fontin-Sans, sans-serif";
        paper.g.text(150, 20, 'Tickets By Milestone').attr({ 'font-size': 20 });
        var pie = paper.g.piechart(150, 150, 100, data['ticket_counts'],{
          legend: data['milestones'],
          lgendpos: 'west',
          href: ['http://localhost:3000/lighthouse_accounts/1']
        });
        pie.hover(
          function() {
            this.sector.stop();
            this.sector.scale(1.1, 1.1, this.cx, this.cy);
            if (this.label) {
              this.label[0].stop();
              this.label[0].scale(1.5);
              this.label[1].attr({"font-weight": 800});
            }
          }, function() {
            this.sector.animate({scale: [1, 1, this.cx, this.cy]}, 500, "bounce");
            if (this.label) {
              this.label[0].animate({scale: 1}, 500, "bounce");
              this.label[1].attr({"font-weight": 400});
            }
          }
        );
      }, 'json');

    }
  });
})
