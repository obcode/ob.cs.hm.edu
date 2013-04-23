<apply template="base">
<bind tag="subtitle">: Home</bind>
        <div id="landing">
          <div class="container">
            <div class="row">
                  <div class="span7">
                    <h1>Evaluation</h1>
                    <h2><lecture/></h2>
                        <p>Prof. Dr. Oliver Braun</p>
                        <p>Sommersemester 2013</p>
                  </div>
                  <div class="span5">
                    <img src="/img/home.png" alt="Home" width="500" height="216" />
                  </div>
                </div>
          </div>
        </div>

        <div id="content" class="txt-middle">
          <div class="container">
            <div class="row">
                <div class="span12">
                  <dfForm action="/eval/${lec}">
                      <dfChildErrorList />

                      <table>
                        <tr><td>
                        <dfLabel ref="question1">1. Die Veranstaltung "<lecture/>" ist inhaltlich interessant:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question1" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question2">2. Ich besuche die Veranstaltung "<lecture/>" gerne:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question2" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question3">3. Prof. Braun hält die Veranstaltung "<lecture/>" selbst gerne:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question3" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question4">4. Prof. Braun kennt sich mit dem Veranstaltungsthema "<lecture/>" zu aus:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question4" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question5">5. Prof. Braun drückt sich klar und verständlich aus:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question5" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question6">6. Die Veranstaltung "<lecture/>" ist gut strukturiert:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question6" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question7">7. Prof. Braun vermittelt die Schlüsselkonzepte, Begriffe und Methoden:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question7" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question8">8. Prof. Braun geht während oder nach der Veranstaltung auf Fragen ein:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question8" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question9">9. Fragen werden zufriedenstellend beantwortet:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question9" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question10">10. Prof. Braun ist regelmäßig für Fragen verfügbar (Sprechstunde, Übung, etc.):
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question10" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question11">11. Das Praktikum unterstützt mein Lernen vernünftig:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question11" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question12">12. Das Praktikum kann im verfügbaren Zeitrahmen von angemessen vorbereiteten Studenten
bewältigt werden:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question12" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question13">13. In der Veranstaltung "<lecture/>" lerne ich etwas Neues dazu:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question13" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question14">14. Ich würde diese Veranstaltung anderen Studierenden empfehlen:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question14" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question15">15. Ich würde den Dozenten anderen Studierenden empfehlen:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question15" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question16">16. Die Veranstaltung "<lecture/>" regt mich dazu an, mich auch weiter mit dem Thema zu beschäftigen:
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question16" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>


                      </table>

                      <dfInputSubmit value="Enter" />
                  </dfForm>
                </div>
                </div>
          </div>
        </div>
</apply>

