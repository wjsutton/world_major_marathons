<h1 style="font-weight:normal">
  The World Marathon Majors
</h1>


[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![GitHub Issues](https://img.shields.io/github/issues/wjsutton/world_major_marathons.svg)](https://github.com/wjsutton/world_major_marathons/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/wjsutton/world_major_marathons.svg)](https://github.com/wjsutton/world_major_marathons/pulls) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

Aggregating results from the World Marathon Majors [https://www.worldmarathonmajors.com/](https://www.worldmarathonmajors.com/) for a dataviz project.

[Twitter][Twitter] :speech_balloon:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[LinkedIn][LinkedIn] :necktie:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[GitHub :octocat:][GitHub]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Website][Website] :link:


<!--
Quick Link 
-->

[Twitter]:https://twitter.com/WJSutton12
[LinkedIn]:https://www.linkedin.com/in/will-sutton-14711627/
[GitHub]:https://github.com/wjsutton
[Website]:https://wjsutton.github.io/

### :a: About

This project involves webscraping marathon results from the World Major Marathons Hall of Fame page [https://www.worldmarathonmajors.com/hall-of-fame/](https://www.worldmarathonmajors.com/hall-of-fame/)
 
This table is loaded by a javascript so that only 20 results appear to start, and for more results the users has to either use the filters at the top of the page or load more results by clicking an icon towards the bottom of the page. 

Inspecting the page with Google Developer Tools > Network > search for 'ajax' we find the an ajax call requesting results to be loaded: [https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D](https://www.worldmarathonmajors.com/ajax/hall_of_fame/?action=load_more&pageStart=1&pageEnd=1&filters=%7B%22searchQuery%22%3A%22%22%2C%22nationality%22%3A%22all%22%2C%22stars%22%3A%22all%22%7D)

By editing the section `pageStart=1&pageEnd=1` we can manipulate what data is returned, and thus what data can be received from the page, e.g. changing `pageStart=1&pageEnd=1` to `pageStart=1&pageEnd=10` means we'll receive the first 200 results instead of just 20.

Note, the data available via the ajax call is limited to 10,000 results. To avoid running hitting the 10k limit the ajax call as filters that can be included in the calls:
- name search
- nationality
- stars

For this project I have focused on stars, so have just filtered the calls by 5 and 6 stars. More details here: [get_wmm_calls.R](https://github.com/wjsutton/world_major_marathons/blob/main/get_wmm_calls.R)

### :chart_with_upwards_trend: See the viz on Tableau Public:<br>
<a href="https://public.tableau.com/profile/will7508#!/vizhome/TheWorldMarathonMajors/TheWorldMarathonMajors">
<img src="https://public.tableau.com/static/images/Th/TheWorldMarathonMajors/TheWorldMarathonMajors/1.png">
</a>
