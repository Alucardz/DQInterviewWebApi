using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using DQInterviewWebApi.Models;
using System.Web.Http.Cors;

namespace DQInterviewWebApi.Controllers
{
    [EnableCors(origins: "http://localhost:8100", headers: "*", methods: "*")]
    public class InterviewsController : ApiController
    {
        private DQIDataEntities db = new DQIDataEntities();

        // GET: api/Interviews
        public IQueryable<Interview> GetInterviews()
        {
            return db.Interviews;
        }

        // GET: api/Interviews/5
        [ResponseType(typeof(Interview))]
        public async Task<IHttpActionResult> GetInterview(int id)
        {
            Interview interview = await db.Interviews.FindAsync(id);
            if (interview == null)
            {
                return NotFound();
            }

            return Ok(interview);
        }

        // GET: api/Interviews/Questions/1
        public  ICollection<Question> GetInterviewQuestions(int jobOpeningId)
        {
            try
            {
                Questionnaire quest = db.Questionnaires
                                .Where(i => i.JobOpening.Id == jobOpeningId)
                                .Include(q => q.Questions).FirstOrDefault();
                if (quest == null)
                {
                    return null;
                }
                return quest.Questions;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        // PUT: api/Interviews/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutInterview(int id, Interview interview)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != interview.Id)
            {
                return BadRequest();
            }

            db.Entry(interview).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InterviewExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Interviews
        [ResponseType(typeof(Interview))]
        public async Task<IHttpActionResult> PostInterview(Interview interview)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Interviews.Add(interview);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = interview.Id }, interview);
        }

        // DELETE: api/Interviews/5
        [ResponseType(typeof(Interview))]
        public async Task<IHttpActionResult> DeleteInterview(int id)
        {
            Interview interview = await db.Interviews.FindAsync(id);
            if (interview == null)
            {
                return NotFound();
            }

            db.Interviews.Remove(interview);
            await db.SaveChangesAsync();

            return Ok(interview);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool InterviewExists(int id)
        {
            return db.Interviews.Count(e => e.Id == id) > 0;
        }
    }
}