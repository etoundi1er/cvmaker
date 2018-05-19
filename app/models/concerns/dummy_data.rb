module Concerns
    class DummyData
        def initialize(user)
            @user = user
        end

        def create_data
            create_cv_template
            create_certifications
            create_educations
            create_experiences
            create_languages
            create_recommendations
            create_social_networks
            create_skills
        end

        def create_cv_template
            @cv_template = @user.cv_templates.create(
                title: 'Example CV',
                description: 'Example CV to help you visualise what your CVs will look like. Enjoy :)',
                summary: 'A curious, enthusiastic and creative human born in December 1991.
                I have been working with passion in creating meaningful and
                functional digital and print products for the past 4 years.',
                firstname: 'Frank',
                lastname: 'Etoundi',
                profession: 'Software Developer',
                phone: '01234567890',
                email: 'frank@etoundi.com',
                website: 'wwww.etoundi.com',
                address: 'Example Street 13
                City 10001
                Country'
            )
        end

        def create_certifications(cv_template = nil)
            cv_template ||= @cv_template

            @user.certifications.create(
                cv_template: cv_template,
                title: 'Adobe Certified Associate',
                company: 'Adobe Inc',
                location: 'Coventry',
                certification_date: '2013'
            )
        end

        def create_educations(cv_template = nil)
            cv_template ||= @cv_template

            @user.educations.create(
                cv_template: cv_template,
                courses: 'MSc Information Technology',
                academy: 'Leeds Beckett University',
                location: 'Leeds, United Kingdom',
                start_date: '2014',
                end_date: '2015',
                summary: "Key modules:
                          <ul>
                              <li>Design patterns for web applications development</li>
                              <li>Service Oriented Architecture Mobile apps development (for Android)</li>
                              <li>UX Design</li>
                              <li>Responsive web development</li>
                          </ul>"
            )

            @user.educations.create(
                cv_template: cv_template,
                courses: 'BA Graphic Design',
                academy: 'Coventry University',
                location: 'Coventry, United Kingdom',
                start_date: '2010',
                end_date: '2013',
                summary: "Key modules:
                          <ul>
                              <li>Integrated design</li>
                              <li>Typography</li>
                              <li>Design in context</li>
                              <li>Visual communication</li>
                              <li>Creative Enterprise</li>
                              <li>Effective communication skills</li>
                          </ul>"
            )
        end

        def create_experiences(cv_template = nil)
            cv_template ||= @cv_template
            @user.experiences.create(
                cv_template: cv_template,
                position: 'Software Developer',
                company: 'Bilendo GMBH',
                location: 'Munich, Germany',
                start_date: '2016'
            )
            @user.experiences.create(
                cv_template: cv_template,
                position: 'Founder & CTO',
                company: 'Orakura Ltd',
                location: 'Yaounde, Cameroon',
                start_date: '2015'
            )
            @user.experiences.create(
                cv_template: cv_template,
                position: 'Freelance Developer & Designer',
                company: 'Multiple Companies',
                location: 'London, United Kingdom',
                start_date: '2010',
                end_date: '2016',
                summary: '<p>Worked with companies in various industries as <strong>graphic designer, software developer, UI/UX designer.</strong></p>
                         These includes:
                         <ul>
                             <li>The Church of England</li>
                             <li>Dominion Design & Publishing</li>
                             <li>Coventry University</li>
                             <li>Internviews</li>
                         </ul>'
            )
        end

        def create_languages(cv_template = nil)
            cv_template ||= @cv_template
            @user.languages.create(
                cv_template: cv_template,
                name: 'English',
                level: 'Native Speaker'
            )
            @user.languages.create(
                cv_template: cv_template,
                name: 'French',
                level: 'Native Speaker'
            )
            @user.languages.create(
                cv_template: cv_template,
                name: 'German',
                level: 'Fluent'
            )
        end

        def create_recommendations(cv_template = nil)
            cv_template ||= @cv_template
            @user.recommendations.create(
                cv_template: cv_template,
                name: 'Itachi Uchiha',
                profession: 'Chief Security Officer',
                company: 'Akatsuki',
                phone: '+10 234567890',
                email: 'itachi@akatsuki.co.jp'
            )
            @user.recommendations.create(
                cv_template: cv_template,
                name: 'Roronoa Zoro',
                profession: 'Swordman',
                company: 'Sunny Go Group',
                phone: '+22 243267890',
                email: 'zoro@sunny.world'
            )
            @user.recommendations.create(
                cv_template: cv_template,
                name: 'Mizuno Kanta',
                profession: 'Desert Ghost',
                company: 'Sunabouzu',
                phone: '+44 23456742540',
                email: 'zoro@sunny.world'
            )
        end

        def create_social_networks(cv_template = nil)
            cv_template ||= @cv_template
            @user.social_networks.create(
                cv_template: cv_template,
                title: 'linkedin',
                url: 'https://www.linkedin.com/in/franketoundi/',
                username: 'franketoundi'
            )
            @user.social_networks.create(
                cv_template: cv_template,
                title: 'twitter',
                url: 'https://www.twitter.com/etoundi_1er/',
                username: '@etoundi_1er'
            )
        end

        def create_skills(cv_template = nil)
            cv_template ||= @cv_template
            @user.skills.create(
                cv_template: cv_template,
                name: 'Ruby Language',
                level: 'Advanced'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'Ruby On Rails',
                level: 'Advanced'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'JavaScripts',
                level: 'Advanced'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'Typography',
                level: 'Advanced'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'Adobe PS, AI, PR, AE',
                level: 'Advanced'
            )
        end

        def create_interests(cv_template = nil)
            cv_template ||= @cv_template
            @user.interests.create(
                cv_template: cv_template,
                name: 'Part time pirating on Grand Line'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'Running on water'
            )
            @user.skills.create(
                cv_template: cv_template,
                name: 'Taking the red pill'
            )
        end
    end
end
