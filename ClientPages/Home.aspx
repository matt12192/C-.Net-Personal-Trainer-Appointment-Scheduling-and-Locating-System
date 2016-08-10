<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="ClientPages_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
     <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
        <img src="../Images/Slogan1.jpg" class="center-block img-responsive"/>
      
      
    </div>

    <div class="item">
        <img src="../Images/Slogan2.jpg" class="center-block img-responsive"/>
      
      
    </div>

    <div class="item">
        <img src="../Images/Slogan3.jpg" class="center-block img-responsive"/>
      
    </div>

    <div class="item">
        <img src="../Images/Slogan4.jpg" class="center-block img-responsive"/>
      
    </div>

      
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Why Use a Personal Trainer
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <p><strong>Motivation</strong> – Personal trainers wear many hats, serving not only as coach, but as an educator, confidant, role model and a major source of motivation and encouragement as well.</p>
<p><strong>Consistency</strong> – Do you find it difficult to stick to your program? Scheduling regular appointments with a personal trainer helps eliminate any excuses you might come up with for not exercising.</p>
<p><strong>Safety</strong> – Unsure about how to use the chest press machine at the gym or how to perform walking lunges without hurting your knees? A personal trainer will show you how to exercise safely (including which exercises to avoid) and instruct you on the proper and safe use of exercise equipment.</p>
<p><strong>Individualized Instruction</strong> – What works for one person, may not work for another when it comes to choosing an exercise program. A personal trainer will develop the most effective program for you based on your fitness evaluation results and personal goals. Beginners in particular benefit from instruction on how to perform specific exercises and program planning.</p>
<p><strong>Effective Workouts</strong> – Today's hectic lifestyles mean you don't have time to waste on ineffective exercise routines. Personal trainers help maximize your time by providing workouts designed to meet your goals quickly and efficiently.</p>
<p><strong>Supervision</strong> – Personal attention during exercise is the primary function of personal trainers. Need someone to spot you while you do pull-ups? Looking for feedback on your running form? No problem-that's what your personal trainer is for-to observe, assist and, if necessary, correct as needed.</p>

      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Benefits Of Exercise
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <p><strong>Lowers Heart Rate</strong> - The heart is a muscle. Aerobic exercise strengthens that muscle, so that your heart pumps blood more efficiently by pumping more blood with each beat. Since the exercised heart is more efficient, it transfers more oxygen to the body's cells more easily. This in essence can lengthen your life by several years.</p>
         <p><strong>Reduces The Risk Of Heart Disease</strong> - Exercise reduces clotting in the blood, thus reducing the risk of heart disease. Those who do not exercise run twice the risk of developing heart disease. </p>
          <p><strong>Promotes Strong And Healthy Bones</strong> - Exercise increases circulation and flow of nutrients to the bones, reducing the risk of fractures and osteoporosis.</p>
          <p><strong>Weight Loss And Maintenance</strong> - Essential to both losing weight and maintaining weight loss, exercise increases the body's metabolism (the rate at which the body burns calories), as well as increase muscle which helps burn fat.</p>
      
      
      
      
      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Benefits of a good balanced diet
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        <p><strong>Eating right and exercising regularly can help you avoid excess weight gain and maintain a healthy weight</strong></p>
          <p><strong>Doing right by your body pays off for your mind as well. The Mayo Clinic notes that physical activity stimulates brain chemicals that often leave you feeling both happier and more relaxed</strong></p>
      </div>
    </div>
  </div>
</div>
   
</section>

</asp:Content>
