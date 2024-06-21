import Pet from '../models/petModel.js';

// Get all pets
export const getPets = async (req, res) => {
  try {
    const pets = await Pet.find({});
    res.json(pets);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Add a new pet
export const addPet = async (req, res) => {
  try {
    const { image, name, id, location, description, rate, price, ownerName, ownerPhoto, sex, age, color, album } = req.body;

    const pet = new Pet({
      image,
      name,
      id,
      location,
      description,
      rate,
      price,
      ownerName,
      ownerPhoto,
      sex,
      age,
      color,
      album,
    });

    const createdPet = await pet.save();
    res.status(201).json(createdPet);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Add pet to favorite list
export const addToFavorites = async (req, res) => {
  try {
    const pet = await Pet.findById(req.params.id);
    if (pet) {
      pet.isFavorited = true;
      await pet.save();
      res.json({ message: 'Pet added to favorites' });
    } else {
      res.status(404).json({ message: 'Pet not found' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
// Delete a particular pet
export const deletePet = async (req, res) => {
  try {
    const pet = await Pet.findById(req.params.id);
    if (pet) {
      await pet.remove();
      res.json({ message: 'Pet deleted successfully' });
    } else {
      res.status(404).json({ message: 'Pet not found' });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete all pets
export const deleteAllPets = async (req, res) => {
  try {
    await Pet.deleteMany({});
    res.json({ message: 'All pets deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};