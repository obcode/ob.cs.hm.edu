<apply template="base">
<bind tag="subtitle">: Home</bind>
        <div id="landing">
          <div class="container">
            <div class="row">
                  <div class="span7">
                    <h1>Evaluation</h1>
                    <h2><lecture/></h2>
                        <p>Prof. Dr. Oliver Braun</p>
                        <p><semester/></p>
                  </div>
                  <div class="span5">
                    <img src="/img/home.png" alt="Home" width="500" height="216" />
                  </div>
                </div>
          </div>
        </div>

        <div id="content">
          <div class="container">
            <div class="row">
                <div class="span12">
                  <dfForm action="/eval/${lec}" accept-charset="utf-8">
                      <dfChildErrorList />

                      <table>
                        <tr><td>
                        <h3>Veranstaltung und Dozent</h3>
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question1"><b>1. Die Veranstaltung "<lecture/>" ist inhaltlich interessant:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question1" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question2"><b>2. Ich besuche die Veranstaltung "<lecture/>" gerne:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question2" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question3"><b>3. Prof. Braun hält die Veranstaltung "<lecture/>" selbst gerne:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question3" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question4"><b>4. Prof. Braun kennt sich mit dem Veranstaltungsthema "<lecture/>" zu
aus:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question4" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question5"><b>5. Prof. Braun drückt sich klar und verständlich aus:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question5" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question6"><b>6. Die Veranstaltung "<lecture/>" ist gut strukturiert:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question6" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question7"><b>7. Prof. Braun vermittelt die Schlüsselkonzepte, Begriffe und
Methoden:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question7" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question8"><b>8. Prof. Braun geht während oder nach der Veranstaltung auf Fragen
ein:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question8" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question9"><b>9. Fragen werden zufriedenstellend beantwortet:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question9" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question10"><b>10. Prof. Braun ist regelmäßig für Fragen verfügbar (Sprechstunde,
Übung, etc.):</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question10" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question11"><b>11. Das Praktikum unterstützt mein Lernen vernünftig:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question11" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question12"><b>12. Das Praktikum kann im verfügbaren Zeitrahmen von angemessen vorbereiteten Studenten
bewältigt werden:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question12" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question13"><b>13. In der Veranstaltung "<lecture/>" lerne ich etwas Neues dazu:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question13" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question14"><b>14. Ich würde diese Veranstaltung anderen Studierenden empfehlen:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question14" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question15"><b>15. Ich würde den Dozenten anderen Studierenden empfehlen:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question15" />
                        </td></tr>
                       <tr><td><hr class="dashed"></td></tr>

                        <tr><td>
                        <dfLabel ref="question16"><b>16. Die Veranstaltung "<lecture/>" regt mich dazu an, mich auch weiter
mit dem Thema zu beschäftigen:</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question16" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question17"><b>17. Was war Ihrer Meinung nach das Beste an der Veranstaltung
"<lecture/>"?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputTextArea ref="question17" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question18"><b>18. Was würden Sie ändern?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputTextArea ref="question18" />
                        </td></tr>
                        <tr><td>
                        <h3>Ihre Situation</h3>
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question19"><b>19. Wie viele Veranstaltungen haben Sie besucht?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question19" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question20"><b>20. Wie viele Übungen/Praktika haben Sie besucht?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question20" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question21"><b>21. Welchen Anteil des Veranstaltungsstoffes haben Sie grundsätzlich
verstanden?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question21" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question22"><b>22. Welchen Anteil des Veranstaltungsstoffes könnten Sie sofort aktiv anwenden?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question22" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question23"><b>23. Haben Sie in der Vorlesung Fragen gestellt?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question23" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question24"><b>24. Haben Sie in der Übung oder außerhalb der Veranstaltungen Fragen gestellt?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question24" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question25"><b>25. Warum haben Sie die Veranstaltung besucht?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputCheckbox ref="question25a" />
                        <dfLabel ref="question25a">Erforderlich</dfLabel>
                        <dfInputCheckbox ref="question25b" />
                        <dfLabel ref="question25b">Thema</dfLabel>
                        <dfInputCheckbox ref="question25c" />
                        <dfLabel ref="question25c">Dozent</dfLabel>
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question26"><b>26. Haben Sie eine Veranstaltung zum gleichen Thema schon früher gehört?</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputRadio ref="question26" />
                        </td></tr>
                        <tr><td>
                        <h3>Persönlicher Arbeitsaufwand (in Stunden pro Semester)</h3>
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question27"><b>27. Präsenzstunden Veranstaltung</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question27" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question28"><b>28. Vor- bzw. Nachbereitung Veranstaltung</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question28" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question29"><b>29. Präsenzstunden Praktikum/Übung/Tutorium</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question29" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question30"><b>30. Vor- bzw. Nachbereitung Praktikum/Übung/Tutorium</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question30" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question31"><b>31. Prüfungsvorbereitung</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question31" />
                        </td></tr>
                        <tr><td>
                        <dfLabel ref="question32"><b>32. Gesamter Arbeitsaufwand</b>
                        </dfLabel>
                        </td></tr><tr><td>
                        <dfInputText ref="question32" />
                        </td></tr>
                      </table>

                      <dfInputSubmit value="Absenden" />
                  </dfForm>
                </div>
                </div>
          </div>
        </div>
</apply>

