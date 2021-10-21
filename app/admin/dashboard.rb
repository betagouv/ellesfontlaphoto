ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { "ELLES FONT LA CULTURE BACK OFFICE" }

  content title: proc { "ELLES FONT LA CULTURE BACK OFFICE" } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Bienvenue dans le back office choisissez une action :"
        columns do
          column do
            panel "Creer un Conseil/Temoignage Video" do
              link_to "Creer un Conseil/Temoignage Video", new_admin_conseils_video_path
            end
            panel "Creer un Conseil/Temoignage Article" do
              link_to "Creer un Conseil/Temoignage Article", new_admin_conseils_article_path
            end
            panel "Creer une nouvelle Aide" do
              link_to "Creer une nouvelle Aide", new_admin_help_path
            end
          end # content
        end
      end
    end
  end
end
