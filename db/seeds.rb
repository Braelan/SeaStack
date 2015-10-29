# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create!(title: "Where is seaweed grown commercially/ how developed is the industry?",
                 body: "please provide information on type, conditions and market where available", user_id: 1)
Answer.create!(body: "Growing Australian Seaweed Aquaculture: http://algaeasia.com/2014/09/seaweed-farming-australias-next-aquaculture-industry/",
                   user_id: 1, question_id: 1)
    Answer.create!(body: "Kelp For Farmers: Seaweed Becomes A New Crop In America: http://www.npr.org/blogs/thesalt/2012/10/12/162728509/kelp-for-farmers-seaweed-becomes-a-new-crop-in-america",
                   user_id: 1, question_id: 1)
    Answer.create!(body: "Chilean seaweed article : http://www.i-mar.cl/investigacion/resumenes/Resumen%20FONDEF%20D04T1047.pdf",
                    user_id: 1, question_id: 1)
    Answer.create!(body: "Press on Norway Seaweed: http://www.nrk.no/sognogfjordane/her-haustar-dei-taren-1.11748739",
                   user_id: 1, question_id: 1)
    Answer.create!(body: "China, Japan and Korea have the most developed industry. Also the Phillipines.", user_id: 1, question_id: 1)
    Question.create!(title: "What are the grants available for commercial Seaweed production in the US?",
                     body: "Please give links where available and list the region", user_id: 1)
    Answer.create!(body: "USDA specialty crop initiative: \n \n http://www.csrees.usda.gov/newsroom/pdfs/scri_factsheet.pdf",
                   user_id: 1, question_id: 2)
    Answer.create!(body: "Uconn USDA grant project summary:
                                                http://portal.nifa.usda.gov/web/crisprojectpages/1004428-developing-an-environmentally-and-economically-sustainable-sugar-kelp-aquaculture-industry-in-southern-new-england-from-seed-to-market.html",
                                                user_id: 1, question_id: 2)
    Answer.create!(body: "Also look into NOAA seagrants",
                                  user_id: 1, question_id: 2)
    Question.create!(title: "What is the impact of kelp farming on ocean acidification?", body: "scientific articles discussing carbon sequestration", user_id: 1)
     Answer.create!(body: "Article on kelp, photosynthesis, acidification, mentions calcification: http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0062689",
                    user_id: 1, question_id: 3)
      Answer.create!(body: "Using marine macroalgae for carbon sequestration: a critical appraisal  Article by Ik Kyo Chung et al.",
                    user_id: 1, question_id: 3)

    Question.create!(title: "Where are good kelp growing manuals?", body: "Please provide links, and brief description", user_id: 1)
    Answer.create!(body: "Irish manual, economic analysis:  http://www.bim.ie/our-publications/aquaculture/",
                    user_id: 1, question_id: 4)
    Answer.create!(body: "Maine Ocean Approved Farm manual: http://static.squarespace.com/static/52f23e95e4b0a96c7b53ad7c/t/52f78b0de4b0374e6a0a4da8/1391954701750/OceanApproved_KelpManualLowRez.pdf",
                  user_id: 1, question_id: 4)
    Answer.create!(body: "Uconn seagrant manual: http://seagrant.uconn.edu/publications/aquaculture/handbook.pdf",
                  user_id: 1, question_id: 4)

    Question.create!(title: "Where on the web are great active seaweed sites?", body: "Hopefully up to date and beats a google search", user_id: 1)
    Answer.create!(body: "http://www.algaeindustrymagazine.com/", user_id: 1, question_id: 5)
    Answer.create!(body: "Site covers micro + macro algae: http://news.algaeworld.org/", user_id: 1, question_id: 5)

    Question.create!(title: "When are seaweed conferences and events?", body: "please post with location", user_id: 1)
    Answer.create!(body: "Algae biomass Summit:  http://www.algaebiomasssummit.org/?page=Sponsor",
                   user_id: 1, question_id: 6)

    Question.create!(title: "What are best multitrophic aquaculture practices?", body: "articles and other info", user_id: 1)
    Answer.create!(body: "Chopin article on Research into MTA: http://www.academia.edu/1953687/Integrated_aquaculture_rationale_evolution_and_state_of_the_art_emphasizing_seaweed_biofiltration_in_modern_mariculture",
                   user_id: 1, question_id: 7)

    Question.create!(title: "What is the state of the aquaculture industry?", body: "economics, science, algal centric", user_id: 1)
    Answer.create!(body: "fao chart showing growth: http://commons.wikimedia.org/wiki/File:Global_aquaculture_production.png",
                   user_id: 1, question_id: 8)

    Question.create!(title: "What are the US companies?", body: "where and what", user_id: 1)
    Answer.create!(body: "Oceans Halo (seaweed chip)", user_id: 1, question_id: 9)
    Answer.create!(body: "The Great and Wonderful Sea of Change Trading co.", user_id: 1, question_id: 9)
    Answer.create!(body: "Ocean Approved", user_id: 1, question_id: 9)

    Question.create!(title: "What are the uses for seaweed?", body: "industry specific, processing information, links, content, biofuel, food, additives etc.", user_id: 1)
