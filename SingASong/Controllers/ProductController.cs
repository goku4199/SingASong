using Microsoft.AspNetCore.Mvc;
using SingASong.Models;
using SingASong.Repository;

namespace SingASong.Controllers
{
    public class ProductController : Controller
    {
        /*public IActionResult ProductCatalogue()
        {
            return View();
        }*/

        private readonly MusicRepository _musicRepository;

        public ProductController()
        {
            _musicRepository = new MusicRepository();
        }

        public IActionResult ProductCatalogue()
        {
            List<Music> musicList = _musicRepository.GetAllMusic();
            return View(musicList);
        }

        [HttpGet]
        public IActionResult Create_song()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create_song(Music music)
        {
            if (ModelState.IsValid)
            {
                _musicRepository.AddMusic(music);
                return RedirectToAction(nameof(ProductCatalogue));
            }
            return View(music);
        }

        [HttpGet]
        [Route("Edit_song/{id}")]
        public IActionResult Edit_song(int id)
        {
            Music music = _musicRepository.GetMusicById(id);
            return View(music);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit_song_post(Music music)
        {
            if (ModelState.IsValid)
            {
                _musicRepository.UpdateMusic(music);
                return RedirectToAction(nameof(ProductCatalogue));
            }
            return View(music);
        }

        [HttpGet]
        [Route("Delete_song/{id}")]
        public IActionResult Delete_song(int id)
        {
            _musicRepository.DeleteMusic(id);
            return RedirectToAction(nameof(ProductCatalogue));
        }
    }
}
