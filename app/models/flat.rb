class Flat < ApplicationRecord
  # Un appartement doit toujours avoir un nom et une adresse
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  validates :address, presence: true, uniqueness: true

  # La description est obligatoire
  validates :description, presence: true, length: { minimum: 10 }

  # Le prix par nuit doit être un nombre positif
  validates :price_per_night, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Le nombre de voyageurs doit être un entier entre 1 et 10
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

  # Vérification de l'URL de l'image (optionnelle)
  validates :picture_url, format: {
    with: /\Ahttps?:\/\/.*(jpg|jpeg|png|gif|\?)/i,
    message: "doit être une URL d'image valide"
  }, allow_blank: true

end
