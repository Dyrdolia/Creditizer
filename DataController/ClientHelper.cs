using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;

namespace DataController
{
    /// <summary>
    /// Db access helper for clientProfile entity
    /// </summary>
    public class ClientHelper
    {
        private static ILog _log = LogManager.GetLogger(typeof (ClientHelper));
        
        #region search
        
        /// <summary>
        /// Try to find in db clientProfile, that matches specified params (ex. firstname, lastname, birthday...).
        /// </summary>
        /// <param name="predicate">Predicate for selection.</param>
        /// <returns>First of matching clients.</returns>
        public Client FindClientProfile(Func<Client,bool> predicate)
        {
            Client client;
            using (var context = new CreditizerEntities())
            {
                client = context.Clients.FirstOrDefault(a => predicate.Invoke(a));
            }
            return client;
        }

        /// <summary>
        /// Try to find in db clients, that matches specified params (ex. firstname, lastname, birthday...).
        /// </summary>
        /// <param name="predicate">Predicate for selection.</param>
        /// <returns>List of all matching clients.</returns>
        public IQueryable<Client> FindClientsProfiles(Func<Client, bool> predicate)
        {
            IQueryable<Client> clients;
            using (var context = new CreditizerEntities())
            {
                clients = context.Clients.Where(a => predicate.Invoke(a));
            }
            return clients;
        }

        #endregion

        /// <summary>
        /// Check that fields are filling correctly (ex. before saving or updating).
        /// </summary>
        /// <param name="clientProfile">The clientProfile entity for checking.</param>
        /// <returns>True, if all field contain valid values.</returns>
        public bool ValidateClientProfile(Client clientProfile)
        {
            bool result;
            using (var context = new CreditizerEntities())
            {
                result = context.Entry(clientProfile).GetValidationResult().IsValid;
            }
            return result;

            // ?todo: return object with description and status code
        }


        /// <summary>
        /// Creates the client profile or updates exiting.
        /// </summary>
        /// <param name="clientProfile">The client profile.</param>
        /// <returns></returns>
        /// <exception cref="System.NotImplementedException"></exception>
        public Client SaveClientProfile(Client clientProfile)
        {
            if (ValidateClientProfile(clientProfile))
            {
                using (var context = new CreditizerEntities())
                {
                    context.Clients.Attach(clientProfile);
                    if (context.Clients.Any(c => c.Id == clientProfile.Id))
                    {
                        context.Entry(clientProfile).State = EntityState.Modified;
                    }
                    else
                    {
                        context.Entry(clientProfile).State = EntityState.Added;
                    }
                    context.SaveChanges();
                }
            }
            else
            {
                throw new NotImplementedException();
            }
            return clientProfile;
        }
    }
}
