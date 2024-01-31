using SingASong.Models;
using System.Text.Json;

namespace SingASong.Repository
{
    public class MusicRepository
    {
        private const string JsonFilePath = "C:\\Users\\anshumaan.tiwari\\OneDrive - Incedo Technology Solutions Ltd\\Desktop\\SingASong-main-master\\SingASong\\Repository\\musicData.json"; // Specify the path to your JSON file

        public List<Music> GetAllMusic()
        {
            var jsonData = File.ReadAllText(JsonFilePath);
            return JsonSerializer.Deserialize<List<Music>>(jsonData);
        }

        public void AddMusic(Music music)
        {
            var musicList = GetAllMusic();
            music.Id = musicList.Count + 1;
            musicList.Add(music);
            SaveChanges(musicList);
        }

        public void UpdateMusic(Music updatedMusic)
        {
            var musicList = GetAllMusic();
            var existingMusic = musicList.Find(m => m.Id == updatedMusic.Id);

            if (existingMusic != null)
            {
                existingMusic.Title = updatedMusic.Title;
                existingMusic.Artist = updatedMusic.Artist;
                existingMusic.Price = updatedMusic.Price;

                SaveChanges(musicList);
            }
        }

        public void DeleteMusic(int musicId)
        {
            var musicList = GetAllMusic();
            var existingMusic = musicList.Find(m => m.Id == musicId);

            if (existingMusic != null)
            {
                musicList.Remove(existingMusic);
                SaveChanges(musicList);
            }
        }

        private void SaveChanges(List<Music> musicList)
        {
            var jsonData = JsonSerializer.Serialize(musicList, new JsonSerializerOptions { WriteIndented = true });
            File.WriteAllText(JsonFilePath, jsonData);
        }

        public Music GetMusicById(int id)
        {
            var allMusic = GetAllMusic();
            return allMusic.FirstOrDefault(m => m.Id == id);
        }

    }
}
